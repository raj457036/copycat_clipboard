package com.entilitystudio.android_background_clipboard

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Binder
import android.os.Build
import android.os.IBinder
import android.util.Log
import android.view.WindowManager
import android.view.textclassifier.TextClassifier
import android.view.textclassifier.TextLinks
import android.widget.LinearLayout
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.InputStream

enum class ClipAction {
    Pending,
    PartialSuccess,
    Success,
    Duplicate,
    Failed,
}

class CopyCatClipboardService: Service() {
    private lateinit var clipboardManager: ClipboardManager
    private lateinit var notificationManager: NotificationManager
    private lateinit var windowManager: WindowManager
    lateinit var copycatStorage: CopyCatSharedStorage
    private val notificationId: Int = 1
    private lateinit var notificationBuilder: NotificationCompat.Builder
    private var lastCopiedText: String? = null

    private var overlayLayout: LinearLayout? = null

    private val nChannelId = "copycat-notification-channel"
    private val logTag = "CopyCatClipboardService"
    private val binder = LocalBinder()

    private val ackToastEnable: Boolean
        get() = copycatStorage.showAckToast

    inner class LocalBinder : Binder() {
        fun getService(): CopyCatClipboardService = this@CopyCatClipboardService
    }

    fun performClipboardRead(appPackageName: String) {

        if (copycatStorage.excludedPackages.contains(appPackageName)) {
            Log.d(logTag,"$appPackageName is excluded by exclusion rules.")
            showAck("Clip not synced due to exclusion rules")
            return
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            getFocusOnOverlay()
            readClipboard()
            removeFocusOnOverlay()
        }
    }

    fun writeToClipboard(data: String) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            getFocusOnOverlay()
            val clip = ClipData.newPlainText("CopyCat", data)
            clipboardManager.setPrimaryClip(clip)
            removeFocusOnOverlay()
        }
    }

    private fun readUriClip(uri: Uri): ClipAction {
        return when (uri.scheme) {
            "content" -> {
                // Media or File!
                var inputStream: InputStream? = null
                try {
                    inputStream = contentResolver.openInputStream(uri)
                    ClipAction.Success
                } finally {
                    inputStream?.close()
                }
            }

            else -> {
                writeTextToCopyCatClipboard(uri.toString(), ClipType.Url)
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.R)
    private fun readTextLinks(tls: TextLinks): ClipAction {

        val text = tls.text
        for (link in tls.links) {
            if (link.getConfidenceScore(TextClassifier.TYPE_URL) == 1.0f) {
                val url = text.substring(link.start, link.end)
                if (url.startsWith("http://") || url.startsWith("https://"))
                {
                    Log.d(logTag, "Clipboard Link: $url")
                    return writeTextToCopyCatClipboard(url, ClipType.Url)
                }
            }
            if (link.getConfidenceScore(TextClassifier.TYPE_EMAIL) == 1.0f) {
                val email = text.substring(link.start, link.end)
                Log.d(logTag, "Clipboard Email: $email")
                return writeTextToCopyCatClipboard(email, ClipType.Email)
            }
            if (link.getConfidenceScore(TextClassifier.TYPE_PHONE) == 1.0f) {
                val phone = text.substring(link.start, link.end)
                Log.d(logTag, "Clipboard Phone: $phone")
                return writeTextToCopyCatClipboard(phone, ClipType.Phone)
            }
            if (link.getConfidenceScore(TextClassifier.TYPE_PHONE) == 1.0f) {
                val phone = text.substring(link.start, link.end)
                Log.d(logTag, "Clipboard Phone: $phone")
                return writeTextToCopyCatClipboard(phone, ClipType.Phone)
            }
        }
        return ClipAction.Pending
    }


    private fun writeTextToCopyCatClipboard(text: String, type: ClipType, desc: String? = null): ClipAction {
        if (lastCopiedText == text) {
            Log.d(logTag, "Detected duplicate item")
            return ClipAction.Duplicate
        }
        lastCopiedText = text
        copycatStorage.writeTextClip(text, type, desc ?: "")
        return ClipAction.Success
    }

    @OptIn(DelicateCoroutinesApi::class)
    private fun readClipboard() {
        if (!copycatStorage.serviceEnabled) return;
        val clipData = clipboardManager.primaryClip

        GlobalScope.launch(Dispatchers.IO) {
            var actionStatus: ClipAction = ClipAction.Pending

            if (clipData != null && clipData.itemCount > 0) {

                val item = clipData.getItemAt(0)

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    item.textLinks?.let {
                        val result = readTextLinks(it)
                        actionStatus = if (result == ClipAction.Success && it.text.length ==  lastCopiedText?.length) {
                            result
                        } else {
                            ClipAction.PartialSuccess
                        }
                    }
                }

                if (actionStatus != ClipAction.Success)
                    item.text?.let {
                        Log.d(logTag, "Clipboard Text: $it")
                        actionStatus = writeTextToCopyCatClipboard(it.toString(), ClipType.Text)
                    }

                if (actionStatus != ClipAction.Success)
                    item.uri?.let {
                        Log.d(logTag, "Clipboard URI: $it")
                        actionStatus = readUriClip(it)
                    }
            }

            withContext(Dispatchers.Main) {
                when (actionStatus) {
                    ClipAction.Success -> showAck("CopyCat captured clipboard")
                    ClipAction.Duplicate -> showAck("Detected duplicate item")
                    ClipAction.Failed -> showAck("CopyCat failed to capture clipboard")
                    else -> {}
                }
            }
        }

    }

    private fun showAck(text: String) {
        if (!ackToastEnable) return
        Toast.makeText(this, text, Toast.LENGTH_SHORT).show()
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
            .setSmallIcon(R.drawable.tray_icon)
            .setOngoing(true) // Makes the notification non-dismissible
    }

    private fun showNotification(): Notification {
        return notificationBuilder
            .setContentTitle("CopyCat Clipboard Service")
            .build()
    }

    private val onClipChangeListener = ClipboardManager.OnPrimaryClipChangedListener {
        readClipboard()
    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun setupClipboardManager() {
        clipboardManager.addPrimaryClipChangedListener(onClipChangeListener)
    }

    override fun onCreate() {
        super.onCreate()
        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        clipboardManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        copycatStorage = CopyCatSharedStorage.getInstance(this)
        copycatStorage.start()
        createNotificationChannel()
        prepareNotification()
        startForeground(notificationId, showNotification())
        isRunning=true
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            setupClipboardManager()
        }
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return START_STICKY
    }

    override fun onBind(p0: Intent?): IBinder = binder

    override fun onDestroy() {
        clipboardManager.removePrimaryClipChangedListener(onClipChangeListener)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        } else {
            @Suppress("DEPRECATION")
            stopForeground(true)
        }
        Log.d(logTag, "CopyCatClipboardService Destroyed")
        super.onDestroy()
        isRunning=false
        copycatStorage.clean()
    }

}