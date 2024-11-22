package com.entilitystudio.android_background_clipboard

import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.AccessibilityServiceInfo
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.Build
import android.os.IBinder
import android.util.Log
import android.view.accessibility.AccessibilityEvent
import android.widget.Toast

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
        }
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

    private fun stopClipboardService() {
        val stopIntent = Intent(this, CopyCatClipboardService::class.java)
        stopService(stopIntent)
    }

    private fun detectCopyAck() {
        val text = "CopyCat clipboard for android"
        detectingCopyAck = true
        clipboardService.writeToClipboard(text)
    }

    override fun onServiceConnected() {
        super.onServiceConnected()
        val info = AccessibilityServiceInfo()
        info.apply {
            eventTypes = AccessibilityEvent.TYPES_ALL_MASK
            notificationTimeout = 120
            feedbackType = AccessibilityServiceInfo.FEEDBACK_GENERIC
        }

        serviceInfo = info
        Log.i(logTag, "CopyCat Accessibility Service Connected")
        startClipboardService()
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
//        Log.d(logTag, "Event : $event")


        if (event?.packageName?.startsWith("com.entilitystudio") == true) {
//            Log.d(logTag,"Ignoring CopyCat Clipboard Events")
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
            }
            AccessibilityEvent.TYPE_ANNOUNCEMENT -> {
                if (event.packageName != "com.android.systemui") {
                    return
                }
                val ackText = event.text.toString()

                if (detectingCopyAck && ackText.isNotEmpty()) {
                    notificationAckText = ackText
                    detectingCopyAck = false
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
                    detectingCopyAck = false
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