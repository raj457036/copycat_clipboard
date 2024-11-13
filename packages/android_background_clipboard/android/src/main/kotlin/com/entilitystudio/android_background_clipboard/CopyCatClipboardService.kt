package com.entilitystudio.android_background_clipboard

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
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
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.InputStream


class CopyCatClipboardService: Service() {
    private lateinit var clipboardManager: ClipboardManager
    private lateinit var notificationManager: NotificationManager
    private lateinit var windowManager: WindowManager
    private lateinit var copycatStorage: CopyCatSharedStorage
    private val notificationId: Int = 1
    private lateinit var notificationBuilder: NotificationCompat.Builder

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
            CoroutineScope(Dispatchers.IO).launch {
                copycatStorage.writeTextClip(uri.toString(), ClipType.url)
            }
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
                    readUriClip(it)
                    success = true
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
        var isRunning: Boolean = false
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(nChannelId, "CopyCat Notification Channel", NotificationManager.IMPORTANCE_HIGH)
            notificationManager.createNotificationChannel(channel)
        }
    }

    private fun prepareNotification() {
        // Intent to stop the service


        notificationBuilder = NotificationCompat.Builder(this, nChannelId)
            .setSmallIcon(android.R.mipmap.sym_def_app_icon)
            .setOngoing(true) // Makes the notification non-dismissible
    }

    private fun showNotification(): Notification {
        return notificationBuilder
            .setContentTitle("CopyCat Service Running")
            .setContentText("The service is currently active.")
            .build()
    }

    override fun onCreate() {
        super.onCreate()
        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        clipboardManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        copycatStorage = CopyCatSharedStorage(this)
        createNotificationChannel()
        prepareNotification()
        startForeground(notificationId, showNotification())
        isRunning=true
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        // Handle the stop action

        return START_STICKY
    }

    override fun onBind(p0: Intent?): IBinder = binder

    override fun onDestroy() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        } else {
            @Suppress("DEPRECATION")
            stopForeground(true)
        }
        Log.d("CopyCatClipboardService", "CopyCatClipboardService Destroyed")
        super.onDestroy()
        isRunning=false
    }

}