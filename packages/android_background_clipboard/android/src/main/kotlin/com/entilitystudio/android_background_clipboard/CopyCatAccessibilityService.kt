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

class CopyCatAccessibilityService: AccessibilityService() {
    private val logTag = "CopyCatAccService"
    private var selectionChanged: Boolean = false
    private var contentChanged: Boolean = false
    private var textChanged: Boolean = false
    private var clickDetected: Boolean = false
    private var notification: Boolean = false
    private lateinit var clipboardService: CopyCatClipboardService

    private val connection = object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName?, binder: IBinder?) {
            Log.d(logTag, "OnServiceConnected $name")
            clipboardService = (binder as CopyCatClipboardService.LocalBinder).getService()
            // Now you can call methods on targetService to communicate
        }

        override fun onServiceDisconnected(name: ComponentName?) {
            Log.d(logTag, "OnServiceDisconnected $name")
        }
    }

    private fun onCopyEvent() {
        Log.d(logTag,"COPY OPERATION")
        clipboardService.performClipboardRead("some data")
    }

    private fun shorServiceNotification() {
        val showIntent = Intent(this, CopyCatClipboardService::class.java)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(showIntent)
        } else {
            startService(showIntent)
        }

        val bindIntent = Intent(this, CopyCatClipboardService::class.java)
        bindService(bindIntent, connection, Context.BIND_AUTO_CREATE)
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
        shorServiceNotification()
    }
    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        Log.d(logTag, "Event : $event")


        if (event?.packageName?.startsWith("com.entilitystudio") == true) {
            Log.d(logTag,"Ignoring CopyCat Clipboard Events")
            return
        }

        when (event?.eventType) {
            AccessibilityEvent.TYPE_VIEW_TEXT_SELECTION_CHANGED -> {
                // Step 1: Detect text selection
                selectionChanged = true
            }
            AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED -> {
                // Step 2: Detect text change after selection
                if (selectionChanged) {
                    contentChanged = true
                }
            }
            AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED -> {
                val copiedToast = event.text.contains("Copied")

                if (copiedToast) {
                    onCopyEvent();
                    resetFlags()
                }
                else if (selectionChanged && contentChanged) {
                    onCopyEvent();
                    resetFlags()
                }
            }
            AccessibilityEvent.TYPE_VIEW_CLICKED -> {
                clickDetected = true
            }
            else -> {}
        }

    }

    private fun resetFlags() {
        selectionChanged = false
        textChanged = false
        contentChanged = false
    }

    override fun onInterrupt() {
        Log.d(logTag, "Interrupt")
    }

    override fun onUnbind(intent: Intent?): Boolean {
        Log.i(logTag, "CopyCat Accessibility Service Disconnected")
        return super.onUnbind(intent)
    }
}