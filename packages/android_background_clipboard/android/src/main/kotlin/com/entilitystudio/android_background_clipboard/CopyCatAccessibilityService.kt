package com.entilitystudio.android_background_clipboard

import android.accessibilityservice.AccessibilityService
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.Build
import android.os.IBinder
import android.util.Log
import android.view.accessibility.AccessibilityEvent
import android.widget.Toast


const val DetectionText = "CopyCat"

class CopyCatAccessibilityService: AccessibilityService() {
    private val logTag = "CopyCatAccService"
    private var detectingCopyAck: Boolean = false
    private var notificationAckText: String = "[Copied]"
    private var isClipboardServiceConnected: Boolean = false
    private var currentlyActiveApp: String = ""

    private val strictCheck: Boolean
        get() = clipboardService.copycatStorage.strictCheck

    private lateinit var clipboardService: CopyCatClipboardService

    private val connection = object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName?, binder: IBinder?) {
            Log.d(logTag, "OnServiceConnected $name")
            clipboardService = (binder as CopyCatClipboardService.LocalBinder).getService()
            isClipboardServiceConnected = true
            detectCopyAck()
        }

        override fun onServiceDisconnected(name: ComponentName?) {
            Log.d(logTag, "OnServiceDisconnected $name")
            isClipboardServiceConnected = false
            restartClipboardService()
        }
    }

    // Method to restart the clipboard service if it's disconnected
    private fun restartClipboardService() {
        Log.d(logTag, "Attempting to restart the clipboard service")
        startClipboardService() // Re-start the service
    }

    private fun onCopyEvent() {
        Log.d(logTag,"Copy Event Detected, Reading Clipboard")
        clipboardService.performClipboardRead(currentlyActiveApp)
    }

    private fun startClipboardService() {
        val showIntent = Intent(this, CopyCatClipboardService::class.java)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(showIntent)
        } else {
            startService(showIntent)
        }

        val bindIntent = Intent(this, CopyCatClipboardService::class.java)
        bindService(bindIntent, connection, Context.BIND_AUTO_CREATE)
        Toast.makeText(this, "CopyCat Service Started", Toast.LENGTH_SHORT).show()
    }

    private fun  stopClipboardService() {
        val stopIntent = Intent(this, CopyCatClipboardService::class.java)
        stopService(stopIntent)
    }

    private fun detectCopyAck() {
        Log.d(logTag, "CopyCat Service is detecting ack event...")
        detectingCopyAck = true
        clipboardService.writeToClipboard(DetectionText)
    }

    private fun detectCopyAckComplete() {
        detectingCopyAck = false
        Log.d(logTag, "CopyCat Service successfully detected ($notificationAckText) ack event.")
    }

    override fun onServiceConnected() {
        super.onServiceConnected()
        Log.i(logTag, "CopyCat Accessibility Service Connected")
        startClipboardService()
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        Log.d(logTag, "Event : $event")

        if (Utils.isActivityOnTop) {
            Log.d(logTag, "Ignoring events as current activity is CopyCat itself")
            return
        }

        if (event?.packageName?.startsWith("com.entilitystudio") == true) {
            Log.d(logTag,"Ignoring CopyCat Clipboard Events")
            return
        }


        when (event?.eventType) {
            AccessibilityEvent.TYPE_VIEW_TEXT_SELECTION_CHANGED -> {
//                if (event.fromIndex == -1 && event.toIndex == -1) return
//                // Step 1: Detect text selection
//                selectionChanged = true
//                if (event.fromIndex == event.toIndex) {
//                    if (event.fromIndex == 0 && event.toIndex == 0) {
////                        select all
//                    } else {
////                        unselect
//                    }
//                } else {
////                    select
//                }
            }
            AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED -> {
                event.packageName?.let {
                    currentlyActiveApp = it.toString()
                }

                // Special case for announcement type copy acknowledgement
                if (event.packageName != "com.android.systemui" || event.className.toString() != "android.widget.FrameLayout" || event.text.isEmpty()) {
                    return
                }

                val ackTextSplit = event.text.toString().split(",")
                Log.d(logTag, "Ack TEXT: ${event.text} | $ackTextSplit")

                if (ackTextSplit.size > 1) {
                    val detectionText = ackTextSplit.first()
                    val ackText = ackTextSplit.last()
                    if (detectingCopyAck) {
                        if (!detectionText.contains(DetectionText)) return
                        notificationAckText = ackText
                        detectCopyAckComplete()
                        return
                    }

                    val copyDetected = ackText == notificationAckText
                    if (copyDetected) {
                        onCopyEvent()
                    }
                }
            }
            AccessibilityEvent.TYPE_ANNOUNCEMENT -> {
                if (event.packageName != "com.android.systemui") {
                    return
                }
                val ackText = event.text.toString()

                if (detectingCopyAck && ackText.isNotEmpty()) {
                    notificationAckText = ackText
                    detectCopyAckComplete()
                    return
                }

                val copyDetected = ackText == notificationAckText
                if (copyDetected) {
                    onCopyEvent()
                }
            }
            AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED -> {
                if (event.className != "android.widget.Toast") {
                    return
                }

                val ackText = event.text.toString()
                if (detectingCopyAck && ackText.isNotEmpty()) {
                    notificationAckText = ackText
                    detectCopyAckComplete()
                    return
                }

                val copyDetected = ackText == notificationAckText
                if (copyDetected && (!strictCheck || event.packageName == "android")) {
                    onCopyEvent()
                }
            }
            else -> {}
        }

    }

    override fun onInterrupt() {
        Log.d(logTag, "Interrupt")
    }

    override fun onUnbind(intent: Intent?): Boolean {
        Log.i(logTag, "CopyCat Accessibility Service Disconnected")

        if (isClipboardServiceConnected) unbindService(connection)
        stopClipboardService()
        Toast.makeText(this, "CopyCat Service Stopped", Toast.LENGTH_SHORT).show()
        return super.onUnbind(intent)
    }
}