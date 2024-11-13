package com.entilitystudio.android_background_clipboard

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Binder
import android.os.Build
import android.os.IBinder
import android.util.Log
import android.view.WindowManager
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.ColorInt
import androidx.annotation.RequiresApi
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.InputStream
import kotlin.concurrent.thread


class CopyCatClipboardService: Service() {
    private lateinit var clipboardManager: ClipboardManager
    private lateinit var notificationManager: NotificationManager
    private lateinit var windowManager: WindowManager
    private lateinit var copycatStorage: CopyCatSharedStorage

    private var overlayLayout: LinearLayout? = null

    private val nChannelId = "copycat-notification-channel"
    private val binder = LocalBinder()

    inner class LocalBinder : Binder() {
        fun getService(): CopyCatClipboardService = this@CopyCatClipboardService
    }

    fun performClipboardRead(data: String) {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            getFocusOnOverlay()
            readClipboard()
            removeFocusOnOverlay()
        }
    }

    private fun readUriClip(uri: Uri) {
        if (uri.scheme == "content") {
            // Media or File!
            var inputStream: InputStream? = null
            try {
                inputStream = contentResolver.openInputStream(uri)
            } finally {
                inputStream?.close()
            }
        } else {
            copycatStorage.writeTextClip(uri.toString(), ClipType.url)
        }
    }

    @OptIn(DelicateCoroutinesApi::class)
    private fun readClipboard() {
        val clipData = clipboardManager.primaryClip

        GlobalScope.launch(Dispatchers.IO) {
            var success: Boolean = false;
            if (clipData != null && clipData.itemCount > 0) {

                val item = clipData.getItemAt(0)

                item.text?.let {
                    Log.d("ClipboardService", "Clipboard Text: $it")
                    success = true
                    copycatStorage.writeTextClip(it.toString(), ClipType.text)
                }
                item.uri?.let {
                    Log.d("ClipboardService", "Clipboard URI: $it")
                    if (!success) {
                        readUriClip(item.uri)
                        success = true
                    }
                }
            }

            if (success) {
                withContext(Dispatchers.Main) {
                    showAck()
                }
            }
        }

    }

    private fun showAck() {
        Toast.makeText(this, "CopyCat Captured Clipboard", Toast.LENGTH_SHORT).show()
    }

    private fun removeFocusOnOverlay() {
        windowManager.removeView(overlayLayout)
    }
    @RequiresApi(Build.VERSION_CODES.O)
    private fun getFocusOnOverlay() {
        // Initialize the WindowManager to add the overlay
        windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager

        // Create the overlay layout
        overlayLayout = LinearLayout(this)

        val color = ContextCompat.getColor(this, android.R.color.transparent)
        overlayLayout?.setBackgroundColor(color)
        overlayLayout?.orientation = LinearLayout.VERTICAL
        overlayLayout?.layoutParams = WindowManager.LayoutParams(
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,  // For Android O and above
            WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL,
            android.graphics.PixelFormat.TRANSPARENT
        )

        // Add overlay to the window
        windowManager.addView(overlayLayout, overlayLayout?.layoutParams)
    }

    companion object {
        private const val ACTION_STOP_SERVICE = "ACTION_STOP_SERVICE"
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(nChannelId, "CopyCat Notification Channel", NotificationManager.IMPORTANCE_HIGH)
            notificationManager.createNotificationChannel(channel)
        }
    }

    private fun createServiceNotification(): Notification {
        // Intent to stop the service
        val stopIntent = Intent(this, CopyCatAccessibilityService::class.java).apply {
            action = ACTION_STOP_SERVICE
        }
        val stopPendingIntent = PendingIntent.getService(
            this, 0, stopIntent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        return NotificationCompat.Builder(this, nChannelId)
            .setContentTitle("CopyCat Service Running")
            .setContentText("The service is currently active.")
            .setSmallIcon(android.R.mipmap.sym_def_app_icon)
            .setOngoing(true) // Makes the notification non-dismissible
            .addAction(android.R.drawable.ic_delete, "Stop", stopPendingIntent) // Stop action button
            .build()
    }

    override fun onCreate() {
        super.onCreate()
        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        clipboardManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        copycatStorage = CopyCatSharedStorage(this)
        createNotificationChannel()
        startForeground(1, createServiceNotification())
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        // Handle the stop action
        if (intent?.action == ACTION_STOP_SERVICE) {
            stopSelf()
        }
        return START_STICKY
    }

    override fun onBind(p0: Intent?): IBinder = binder

    override fun onDestroy() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        } else {
            stopForeground(true)
        }
        super.onDestroy()
    }

}