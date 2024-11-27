package com.entilitystudio.android_background_clipboard

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi

class NotificationDeleteReceiver : BroadcastReceiver() {
    @RequiresApi(Build.VERSION_CODES.O)
    override fun onReceive(context: Context, intent: Intent) {
        Log.d("NotificationBroadcast", "Received delete intent")
        val serviceIntent = Intent(context, CopyCatClipboardService::class.java)
        context.startService(serviceIntent)

        // Notify the service to show the notification again
        val notificationServiceIntent = Intent(context, CopyCatClipboardService::class.java)
        notificationServiceIntent.action = "RESTART_NOTIFICATION"
        context.startService(notificationServiceIntent)
    }
}