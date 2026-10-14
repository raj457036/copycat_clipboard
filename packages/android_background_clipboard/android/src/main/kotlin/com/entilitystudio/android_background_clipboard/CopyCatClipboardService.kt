package com.entilitystudio.android_background_clipboard

import android.annotation.SuppressLint
import android.app.Activity
import android.app.Application
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.ClipDescription
import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Binder
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.IBinder
import android.os.PowerManager
import android.os.SystemClock
import android.util.Log
import android.view.textclassifier.TextClassifier
import android.view.textclassifier.TextLinks
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.core.app.NotificationCompat
import androidx.core.app.ServiceCompat
import androidx.core.content.ContextCompat
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import android.provider.OpenableColumns
import java.io.ByteArrayOutputStream
import java.io.InputStream
import java.util.Date

enum class ClipAction {
    Pending,
    PartialSuccess,
    Excluded,
    Success,
    Duplicate,
    Failed,
}

class CopyCatClipboardService : Service() {
    private lateinit var clipboardManager: ClipboardManager
    private lateinit var notificationManager: NotificationManager
    lateinit var copycatStorage: CopyCatSharedStorage
    private val notificationId: Int = 1
    private lateinit var notificationBuilder: NotificationCompat.Builder
    private var lastCopiedText: String? = null
    private var pauseResumeAtMs: Long? = null
    private val mainHandler by lazy { Handler(mainLooper) }
    private val pasteActionDelayMs = 1000L
    private val clipboardAckToastCooldownMs = 3000L
    private val delayedPasteRunnable = Runnable {
        disableDuplicateAnnouncement = true
        performClipboardRead("")
    }
    private val autoResumePauseRunnable = Runnable {
        resumeNotificationPause()
    }
    
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Default)

    private val nChannelId = "copycat-notification-channel"
    private val logTag = "CopyCatClipboardService"
    private val binder = LocalBinder()
    private var resumedActivityCount = 0
    private var lastAckToastPackage: String = ""
    private var lastAckToastAtMs: Long = 0L
    private val detectionModeNotificationListener: (ClipboardDetectionMode) -> Unit = {
        mainHandler.post {
            if (isRunning) {
                prepareAndShowNotification()
            }
        }
    }

    private val appLifecycleCallbacks = object : Application.ActivityLifecycleCallbacks {
        override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) = Unit

        override fun onActivityStarted(activity: Activity) = Unit

        override fun onActivityResumed(activity: Activity) {
            resumedActivityCount += 1
        }

        override fun onActivityPaused(activity: Activity) {
            resumedActivityCount = (resumedActivityCount - 1).coerceAtLeast(0)
        }

        override fun onActivityStopped(activity: Activity) = Unit

        override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) = Unit

        override fun onActivityDestroyed(activity: Activity) = Unit
    }

    // Disable duplicate announcement for one read cycle
    var disableDuplicateAnnouncement: Boolean = false

    private val ackToastEnable: Boolean
        get() = copycatStorage.showAckToast &&
            (copycatStorage.clipboardFeedbackMode == "toast" ||
             copycatStorage.clipboardFeedbackMode == "copyOnly" ||
             copycatStorage.clipboardFeedbackMode == "copyAndSync")

    inner class LocalBinder : Binder() {
        fun getService(): CopyCatClipboardService = this@CopyCatClipboardService
    }

    companion object {
        const val ACTION_CAPTURE_NOW = "CAPTURE_NOW"
        const val ACTION_RESTART_SERVICE = "RESTART_SERVICE"
        const val ACTION_TOGGLE_NOTIFICATION_PAUSE = "TOGGLE_NOTIFICATION_PAUSE"
        const val ACTION_RESHOW_NOTIFICATION = "RESHOW_NOTIFICATION"

        var isRunning: Boolean = false
    }

    private fun isHostAppForeground(): Boolean = resumedActivityCount > 0

    private fun isCapturePaused(): Boolean = copycatStorage.notificationPaused

    private fun isScreenOn(): Boolean {
        val pm = getSystemService(Context.POWER_SERVICE) as? PowerManager
        return pm?.isInteractive ?: true
    }

    private fun redactForLog(value: String?): String {
        if (value.isNullOrEmpty()) return ""
        return if (value.length <= 2) {
            "${value}***"
        } else {
            "${value.take(2)}***"
        }
    }

    private fun resolveAppLabel(packageName: String): String? {
        val normalizedPackage = packageName.trim()
        if (normalizedPackage.isEmpty()) return null
        return try {
            val appInfo = packageManager.getApplicationInfo(normalizedPackage, 0)
            packageManager.getApplicationLabel(appInfo)?.toString()?.trim()?.ifEmpty { null }
        } catch (_: PackageManager.NameNotFoundException) {
            null
        } catch (_: Exception) {
            null
        }
    }

    fun performClipboardRead(appPackageName: String) {
        performClipboardReadFromClipData(clipboardManager.primaryClip, appPackageName)
    }

    fun writeToClipboard(data: String) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            lastCopiedText = data
            copycatStorage.markClipboardWrite(data.toByteArray())
            val clip = ClipData.newPlainText("CopyCat", data)
            clipboardManager.setPrimaryClip(clip)
        }
    }

    fun performClipboardReadFromClipData(clipData: ClipData?, appPackageName: String) {
        if (copycatStorage.detectionMode == ClipboardDetectionMode.MODE_INACTIVE) {
            debugLog(logTag) { "Clipboard capture paused: detection mode is inactive" }
            return
        }
        if (isCapturePaused()) {
            debugLog(logTag) { "Clipboard capture paused from notification tray" }
            return
        }
        if (!isScreenOn()) {
            debugLog(logTag) { "Clipboard capture paused: screen is off" }
            return
        }
        val resolvedPackageName = appPackageName.trim()
        debugLog(logTag) { "Current Package: $resolvedPackageName" }
        debugLog(logTag) { "Current Exclusions: ${copycatStorage.excludedPackages}" }
        if (!copycatStorage.serviceEnabled) {
            Log.w(logTag, "Service not configured")
            return
        }
        // Unknown/blank source package should never trigger exclusion rules.
        val excluded = resolvedPackageName.isNotEmpty() &&
            ((copycatStorage.excludePasswordManagers &&
                copycatStorage.passwordManagers.contains(resolvedPackageName)) ||
                copycatStorage.excludedPackages.contains(resolvedPackageName))
        if (excluded) {
            Log.i(logTag, "$resolvedPackageName is excluded by exclusion rules.")
            if (!disableDuplicateAnnouncement) {
                showClipboardAck("Clip Excluded!", resolvedPackageName)
            }
            return
        }

        readClipboard(clipData, resolvedPackageName)
    }

    private fun readUriClip(
        uri: Uri,
        label: String? = null,
        sourcePackageName: String = "",
        sourceAppName: String? = null,
    ): ClipAction {
        return when (uri.scheme) {
            "content" -> {
                // Skip URIs we wrote ourselves via the LAN binary receiver
                // the clip is already persisted via onLanClipReceived().
                val isSelfAuthority = uri.authority?.equals(
                    "${applicationContext.packageName}.fileProvider", ignoreCase = true
                ) == true
                if (isSelfAuthority) {
                    debugLog(logTag) { "Skipping self-written FileProvider URI" }
                    return ClipAction.Pending
                }

                val mimeType = contentResolver.getType(uri) ?: "application/octet-stream"
                val isMedia = mimeType.startsWith("image/") ||
                    mimeType.startsWith("video/") ||
                    mimeType.startsWith("audio/")
                if (!isMedia) return ClipAction.Pending

                try {
                    val maxBytes = 50 * 1024 * 1024
                    val buffer = ByteArrayOutputStream()
                    var tooLarge = false
                    contentResolver.openInputStream(uri)?.use { stream ->
                        val buf = ByteArray(8192)
                        var totalRead = 0
                        var read: Int
                        while (stream.read(buf).also { read = it } != -1) {
                            totalRead += read
                            if (totalRead > maxBytes) { tooLarge = true; break }
                            buffer.write(buf, 0, read)
                        }
                    } ?: return ClipAction.Pending

                    if (tooLarge) {
                        debugLog(logTag) { "Image too large for LAN sync (>50 MB), skipping" }
                        return ClipAction.Pending
                    }

                    val bytes = buffer.toByteArray()
                    val ext = mimeType.substringAfterLast('/').substringBefore(';')
                        .ifBlank { "bin" }
                    val resolvedName = getDisplayNameFromUri(uri)
                        ?: label?.takeIf { it.isNotBlank() }
                        ?: "media.$ext"

                    when (
                        copycatStorage.writeBinaryClip(
                        data = bytes,
                        mimeType = mimeType,
                        ext = ext,
                        fileName = resolvedName,
                        sourceId = sourcePackageName,
                        sourceApp = sourceAppName,
                    )
                    ) {
                        is CopyCatFileStorage.ClipWriteOutcome.Duplicate -> {
                            return ClipAction.Duplicate
                        }
                        is CopyCatFileStorage.ClipWriteOutcome.Failed -> {
                            return ClipAction.Failed
                        }
                        is CopyCatFileStorage.ClipWriteOutcome.Written -> Unit
                    }
                    disableDuplicateAnnouncement = false
                    ClipAction.Success
                } catch (e: Exception) {
                    Log.e(logTag, "Failed to read URI media clip: ${e.message}")
                    ClipAction.Failed
                } catch (t: Throwable) {
                    Log.e(logTag, "Critical error reading URI media clip: ${t.message}")
                    ClipAction.Failed
                }
            }

            else -> {
                writeTextToCopyCatClipboard(
                    text = uri.toString(),
                    type = ClipType.Url,
                    label = label,
                    sourcePackageName = sourcePackageName,
                    sourceAppName = sourceAppName,
                )
            }
        }
    }

    private fun getDisplayNameFromUri(uri: Uri): String? {
        return try {
            contentResolver.query(
                uri,
                arrayOf(OpenableColumns.DISPLAY_NAME),
                null, null, null,
            )?.use { cursor ->
                if (cursor.moveToFirst()) {
                    val col = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME)
                    if (col >= 0) cursor.getString(col) else null
                } else null
            }
        } catch (e: Exception) {
            null
        }
    }

    private fun isPureEmail(text: String): Boolean {
        return Regex("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", RegexOption.IGNORE_CASE)
            .matches(text.trim())
    }

    private fun isPurePhone(text: String): Boolean {
        val normalized = text.trim().replace(Regex("[\\s().-]+"), "")
        return Regex("^\\+?\\d{7,15}$").matches(normalized)
    }

    private fun isWholeTrimmedTextLink(text: String, trimmedText: String, start: Int, end: Int): Boolean {
        val trimmedStart = text.indexOf(trimmedText)
        return trimmedStart >= 0 && start == trimmedStart && end == trimmedStart + trimmedText.length
    }

    @RequiresApi(Build.VERSION_CODES.R)
    private fun readTextLinks(
        tls: TextLinks,
        label: String? = null,
        sourcePackageName: String = "",
        sourceAppName: String? = null,
    ): ClipAction {

        val text = tls.text.toString()
        val trimmedText = text.trim()

        for (link in tls.links) {
            if (link.getConfidenceScore(TextClassifier.TYPE_EMAIL) == 1.0f && copycatStorage.excludeEmail) {
                return ClipAction.Excluded
            }
            if (link.getConfidenceScore(TextClassifier.TYPE_PHONE) == 1.0f && copycatStorage.excludePhone) {
                return ClipAction.Excluded
            }
        }

        if (isPureEmail(trimmedText)) {
            if (copycatStorage.excludeEmail) return ClipAction.Excluded
            return writeTextToCopyCatClipboard(
                text = trimmedText,
                type = ClipType.Email,
                label = label,
                sourcePackageName = sourcePackageName,
                sourceAppName = sourceAppName,
            )
        }

        if (isPurePhone(trimmedText)) {
            if (copycatStorage.excludePhone) return ClipAction.Excluded
            return writeTextToCopyCatClipboard(
                text = trimmedText,
                type = ClipType.Phone,
                label = label,
                sourcePackageName = sourcePackageName,
                sourceAppName = sourceAppName,
            )
        }

        for (link in tls.links) {
            if (!isWholeTrimmedTextLink(text, trimmedText, link.start, link.end)) {
                continue
            }

            if (link.getConfidenceScore(TextClassifier.TYPE_URL) == 1.0f) {
                val url = text.substring(link.start, link.end)
                if (url.startsWith("http://") || url.startsWith("https://")) {
                    debugLog(logTag) { "Clipboard Link: ${redactForLog(url)}" }
                    return writeTextToCopyCatClipboard(
                        text = url,
                        type = ClipType.Url,
                        label = label,
                        sourcePackageName = sourcePackageName,
                        sourceAppName = sourceAppName,
                    )
                }
            }
            if (link.getConfidenceScore(TextClassifier.TYPE_EMAIL) == 1.0f) {
                if (copycatStorage.excludeEmail) return ClipAction.Excluded

                val email = text.substring(link.start, link.end)
                debugLog(logTag) { "Clipboard Email: ${redactForLog(email)}" }
                return writeTextToCopyCatClipboard(
                    text = email,
                    type = ClipType.Email,
                    label = label,
                    sourcePackageName = sourcePackageName,
                    sourceAppName = sourceAppName,
                )
            }
            if (link.getConfidenceScore(TextClassifier.TYPE_PHONE) == 1.0f) {
                if (copycatStorage.excludePhone) return ClipAction.Excluded

                val phone = text.substring(link.start, link.end)
                debugLog(logTag) { "Clipboard Phone: ${redactForLog(phone)}" }
                return writeTextToCopyCatClipboard(
                    text = phone,
                    type = ClipType.Phone,
                    label = label,
                    sourcePackageName = sourcePackageName,
                    sourceAppName = sourceAppName,
                )
            }
        }
        return ClipAction.Pending
    }


    private fun writeTextToCopyCatClipboard(
        text: String,
        type: ClipType,
        label: String? = null,
        sourcePackageName: String = "",
        sourceAppName: String? = null,
    ): ClipAction {
        val writeResult = copycatStorage.writeTextClipIfLatestMissing(
            text = text,
            type = type,
            label = label ?: "",
            sourceId = sourcePackageName,
            sourceApp = sourceAppName,
        )
        when (writeResult) {
            is CopyCatFileStorage.ClipWriteOutcome.Duplicate -> {
                debugLog(logTag) { "Detected duplicate latest stored item" }
                return ClipAction.Duplicate
            }
            is CopyCatFileStorage.ClipWriteOutcome.Failed -> {
                return ClipAction.Failed
            }
            is CopyCatFileStorage.ClipWriteOutcome.Written -> Unit
        }

        lastCopiedText = text
        disableDuplicateAnnouncement = false
        return ClipAction.Success
    }

    private fun readClipboard(clipData: ClipData?, sourcePackageName: String) {
        serviceScope.launch(Dispatchers.IO) {
            var actionStatus: ClipAction = ClipAction.Pending
            val normalizedSourcePackage = sourcePackageName.trim()
            if (normalizedSourcePackage == applicationContext.packageName) {
                debugLog(logTag) { "Skipping clipboard read from own app ($normalizedSourcePackage)" }
                return@launch
            }
            val sourceAppName = resolveAppLabel(normalizedSourcePackage)

            if (clipData != null && clipData.itemCount > 0) {
                val clipLabel = clipData.description?.label?.toString()
                debugLog(logTag) { "Description Label: $clipLabel" }
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                    debugLog(logTag) { "Description Extras: ${clipData.description?.extras}" }
                }
                val hasNonTextMime = run {
                    val desc = clipData.description ?: return@run false
                    (0 until desc.mimeTypeCount).any { idx ->
                        val mt = desc.getMimeType(idx)?.trim()?.lowercase().orEmpty()
                        mt.isNotEmpty() && !mt.startsWith("text/")
                    }
                }
                val item = clipData.getItemAt(0)

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    item.textLinks?.let {
                        val result = readTextLinks(
                            tls = it,
                            label = clipLabel,
                            sourcePackageName = normalizedSourcePackage,
                            sourceAppName = sourceAppName,
                        )
                        actionStatus = result
                    }
                }

                if (actionStatus != ClipAction.Excluded) {
                    if (
                        actionStatus != ClipAction.Success &&
                        actionStatus != ClipAction.Duplicate
                    )
                        item.uri?.let {
                            debugLog(logTag) { "Clipboard URI: $it" }
                            actionStatus = readUriClip(
                                uri = it,
                                label = clipLabel,
                                sourcePackageName = normalizedSourcePackage,
                                sourceAppName = sourceAppName,
                            )
                        }

                    if (
                        actionStatus != ClipAction.Success &&
                        actionStatus != ClipAction.Duplicate
                    )
                        item.text?.let {
                            val textValue = it.toString()
                            val hasUri = item.uri != null

                            val isLiteralNull = textValue.trim().equals("null", ignoreCase = true)
                            if ((hasUri || hasNonTextMime) && isLiteralNull) {
                                debugLog(logTag) { "Skipping literal null text for URI or non-text MIME clip" }
                            } else {
                                debugLog(logTag) { "Clipboard Text: ${redactForLog(textValue)}" }
                                actionStatus = writeTextToCopyCatClipboard(
                                    text = textValue,
                                    type = ClipType.Text,
                                    label = clipLabel,
                                    sourcePackageName = normalizedSourcePackage,
                                    sourceAppName = sourceAppName,
                                )
                            }
                        }
                }
            }

            withContext(Dispatchers.Main) {
                debugLog(logTag) { "Clip Action: $actionStatus" }
                debugLog(logTag) { "Clip Content: ${redactForLog(lastCopiedText)}" }
                when (actionStatus) {
                    ClipAction.Duplicate -> Unit
                    ClipAction.Failed -> handleClipboardAck(
                        "CopyCat failed to capture clipboard",
                        sourcePackageName,
                    )
                    ClipAction.Excluded -> {
                        if (!disableDuplicateAnnouncement) {
                            handleClipboardAck("Clip Excluded!", sourcePackageName)
                        }
                    }
                    ClipAction.Success -> {
                        if (!disableDuplicateAnnouncement) {
                            handleClipboardAck("Clip Captured!", sourcePackageName)
                        }
                    }
                    else -> {}
                }
            }
        }

    }

    private fun handleClipboardAck(text: String, sourcePackageName: String) {
        val shouldShowToast = copycatStorage.clipboardFeedbackMode == "toast" ||
            copycatStorage.clipboardFeedbackMode == "copyOnly" ||
            copycatStorage.clipboardFeedbackMode == "copyAndSync"

        if (shouldShowToast) {
            showClipboardAck(text, sourcePackageName)
        }
    }

    private fun showClipboardAck(text: String, sourcePackageName: String) {
        if (!ackToastEnable) return

        val now = SystemClock.elapsedRealtime()
        val packageKey = sourcePackageName.trim().ifBlank { "<unknown>" }
        if (packageKey == lastAckToastPackage && now - lastAckToastAtMs < clipboardAckToastCooldownMs) {
            debugLog(logTag) { "Suppressing clipboard ack toast for package=$packageKey" }
            return
        }

        lastAckToastPackage = packageKey
        lastAckToastAtMs = now
        runCatching {
            Toast.makeText(applicationContext, text, Toast.LENGTH_SHORT).show()
        }
    }


    private fun showAck(text: String) {
        if (!ackToastEnable) return
        runCatching {
            Toast.makeText(applicationContext, text, Toast.LENGTH_SHORT).show()
        }
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                nChannelId,
                "CopyCat Notification Channel",
                NotificationManager.IMPORTANCE_HIGH
            )
            channel.description = "CopyCat stays visible here so background clipboard access is always transparent."
            channel.lockscreenVisibility = Notification.VISIBILITY_SECRET
            notificationManager.createNotificationChannel(channel)
        }
    }

    private fun prepareNotification() {
        val notificationColor = if (copycatStorage.notificationPaused) {
            ContextCompat.getColor(this, R.color.copycat_notification_paused)
        } else {
            ContextCompat.getColor(this, R.color.copycat_notification_accent)
        }

        notificationBuilder = NotificationCompat.Builder(this, nChannelId)
            .setSmallIcon(R.drawable.tray_icon)
            .setColor(notificationColor)
            .setColorized(false)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_SERVICE)
            .setVisibility(NotificationCompat.VISIBILITY_SECRET)
            .setOnlyAlertOnce(true)
            .setShowWhen(false)
    }

    @SuppressLint("LaunchActivityFromNotification")
    private fun showNotification(): Notification {
        val contentIntent = buildOpenAppPendingIntent()

        val toggleLabel = if (copycatStorage.notificationPaused) "Resume now" else "Pause for 30 min"
        val toggleIntent = if (copycatStorage.detectionMode != ClipboardDetectionMode.MODE_INACTIVE) {
            buildServicePendingIntent(ACTION_TOGGLE_NOTIFICATION_PAUSE, 791)
        } else {
            null
        }
        val resumeText = if (copycatStorage.notificationPaused) {
            val resumeAtMs = pauseResumeAtMs ?: (System.currentTimeMillis() + 30 * 60 * 1000L)
            val timeFormat = android.text.format.DateFormat.getTimeFormat(this)
            "It will resume at ${timeFormat.format(Date(resumeAtMs))}."
        } else {
            null
        }

        val summaryText = when {
            copycatStorage.notificationPaused ->
                if (resumeText != null) {
                    "Background clipboard capture is paused. $resumeText"
                } else {
                    "Background clipboard capture is paused."
                }
            copycatStorage.detectionMode == ClipboardDetectionMode.MODE_INACTIVE ->
                "Choose a detection mode in CopyCat to start background clipboard capture."
            else -> "Background clipboard capture is running."
        }
        val titleText = if (copycatStorage.notificationPaused) {
            "CopyCat Clipboard Paused"
        } else {
            "CopyCat Clipboard"
        }

        val builder = notificationBuilder
            .setContentTitle(titleText)
            .setContentText(summaryText)
            .setStyle(NotificationCompat.BigTextStyle().bigText(summaryText))
            .setAutoCancel(false)
            .setOngoing(true)
            .setDeleteIntent(buildDeletePendingIntent())

        if (contentIntent != null) {
            builder.setContentIntent(contentIntent)
        }
        if (toggleIntent != null) {
            builder.addAction(R.drawable.tray_icon, toggleLabel, toggleIntent)
        }
        return builder.build().apply {
            flags = flags or Notification.FLAG_ONGOING_EVENT or Notification.FLAG_NO_CLEAR
        }
    }

    private val onClipChangeListener = ClipboardManager.OnPrimaryClipChangedListener {
        if (copycatStorage.detectionMode == ClipboardDetectionMode.MODE_INACTIVE) {
            debugLog(logTag) { "Primary Clipboard capture paused: detection mode is inactive" }
            return@OnPrimaryClipChangedListener
        }
        if (isCapturePaused()) {
            debugLog(logTag) { "Primary Clipboard capture paused from notification tray" }
            return@OnPrimaryClipChangedListener
        }
        if (!isScreenOn()) {
            debugLog(logTag) { "Primary Clipboard capture paused: screen is off" }
            return@OnPrimaryClipChangedListener
        }
        if (isHostAppForeground()) {
            debugLog(logTag) { "Primary Clipboard capture paused: app is in foreground." }
            return@OnPrimaryClipChangedListener
        }
        if (Utils.isActivityOnTop) {
            debugLog(logTag) { "Primary Clipboard disabled! Because top activity is CopyCat itself." }
            return@OnPrimaryClipChangedListener
        }

        debugLog(logTag) { "Reading Primary Clipboard" }
        readClipboard(clipboardManager.primaryClip, "")
    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun setupClipboardManager() {
        clipboardManager.addPrimaryClipChangedListener(onClipChangeListener)
    }

    private fun buildServicePendingIntent(action: String, requestCode: Int): PendingIntent {
        val intent = Intent(this, this::class.java).apply {
            this.action = action
        }

        return PendingIntent.getService(
            this,
            requestCode,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
    }

    private fun buildDeletePendingIntent(): PendingIntent {
        val deleteIntent = Intent(this, NotificationDeleteReceiver::class.java)

        return PendingIntent.getBroadcast(
            this,
            792,
            deleteIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
    }

    private fun buildOpenAppPendingIntent(): PendingIntent? {
        val launchIntent = packageManager.getLaunchIntentForPackage(packageName)
            ?: Intent().setClassName(packageName, "$packageName.MainActivity")

        launchIntent.addFlags(
            Intent.FLAG_ACTIVITY_NEW_TASK or
                Intent.FLAG_ACTIVITY_CLEAR_TOP or
                Intent.FLAG_ACTIVITY_SINGLE_TOP,
        )

        return PendingIntent.getActivity(
            this,
            789,
            launchIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
    }

    private fun toggleNotificationPause() {
        if (copycatStorage.detectionMode == ClipboardDetectionMode.MODE_INACTIVE) {
            debugLog(logTag) { "Ignoring notification pause toggle: detection mode is inactive" }
            prepareAndShowNotification()
            return
        }

        if (copycatStorage.notificationPaused) {
            resumeNotificationPause()
            return
        }

        mainHandler.removeCallbacks(delayedPasteRunnable)
        copycatStorage.updateNotificationPaused(true)
        pauseResumeAtMs = System.currentTimeMillis() + 30 * 60 * 1000L
        mainHandler.removeCallbacks(autoResumePauseRunnable)
        mainHandler.postDelayed(autoResumePauseRunnable, 30 * 60 * 1000L)
        debugLog(logTag) { "Notification paused clipboard capture for 30 minutes" }
        runCatching {
            Toast.makeText(applicationContext, "CopyCat Clipboard Paused for 30 minutes", Toast.LENGTH_SHORT).show()
        }

        prepareAndShowNotification()
    }

    private fun resumeNotificationPause() {
        mainHandler.removeCallbacks(autoResumePauseRunnable)
        if (!copycatStorage.notificationPaused) {
            return
        }
        copycatStorage.updateNotificationPaused(false)
        pauseResumeAtMs = null
        debugLog(logTag) { "Notification resumed clipboard capture" }
        runCatching {
            Toast.makeText(applicationContext, "CopyCat Clipboard Resumed", Toast.LENGTH_SHORT).show()
        }
        prepareAndShowNotification()
    }

    private fun postNotificationUpdate(notification: Notification) {
        notificationManager.notify(notificationId, notification)
    }

    private fun prepareAndShowNotification(forceForegroundRestart: Boolean = false) {
        createNotificationChannel()
        prepareNotification()
        val notification = showNotification()

        if (!forceForegroundRestart && isRunning) {
            postNotificationUpdate(notification)
            return
        }
        
        // Handle Android 14+ foreground service type requirements
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
                // Android 14+ (API 34+): Use FOREGROUND_SERVICE_TYPE_SPECIAL_USE
                startForeground(
                    notificationId, 
                    notification, 
                    android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE
                )
            } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                // Android 10+ (API 29+): Use FOREGROUND_SERVICE_TYPE_DATA_SYNC
                startForeground(
                    notificationId, 
                    notification, 
                    android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC
                )
            } else {
                // Pre-Android 10: No service type needed
                startForeground(notificationId, notification)
            }
        } catch (e: Exception) {
            Log.e(logTag, "Failed to start foreground service with specific type: ${e.message}")
            // Fallback: try without service type
            try {
                startForeground(notificationId, notification)
            } catch (ex: Exception) {
                Log.e(logTag, "Failed to start foreground service: ${ex.message}", ex)
                // If we can't start as foreground, stop the service
                stopSelf()
            }
        }
    }

    override fun onCreate() {
        super.onCreate()
        application.registerActivityLifecycleCallbacks(appLifecycleCallbacks)
        copycatStorage = CopyCatSharedStorage.getInstance(this)
        clipboardManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        copycatStorage.start()
        copycatStorage.removeDetectionModeListener(detectionModeNotificationListener)
        copycatStorage.addDetectionModeListener(detectionModeNotificationListener)
        copycatStorage.setRemoteClipApplier { content ->
            mainHandler.post {
                disableDuplicateAnnouncement = true
                writeToClipboard(content)
            }
        }
        prepareAndShowNotification()
        isRunning = true
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            setupClipboardManager()
        }
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        // Ensure notification is shown if service was restarted
        if (!isRunning) {
            try {
                prepareAndShowNotification(forceForegroundRestart = true)
                isRunning = true
            } catch (e: Exception) {
                Log.e(logTag, "Failed to show notification on restart: ${e.message}", e)
                stopSelf()
                return START_NOT_STICKY
            }
        }
        
        when (intent?.action) {
            ACTION_RESTART_SERVICE -> {
                debugLog(logTag) { "Service restart requested" }
                prepareAndShowNotification(forceForegroundRestart = true)
                if (!isRunning) {
                    isRunning = true
                }
            }
            ACTION_RESHOW_NOTIFICATION -> {
                debugLog(logTag) { "Notification re-show requested" }
                prepareAndShowNotification(forceForegroundRestart = true)
            }
            ACTION_CAPTURE_NOW -> {
                mainHandler.removeCallbacks(delayedPasteRunnable)
                mainHandler.post {
                    disableDuplicateAnnouncement = true
                    performClipboardRead("")
                }
            }
            ACTION_TOGGLE_NOTIFICATION_PAUSE -> {
                toggleNotificationPause()
            }
        }
        return START_STICKY
    }

    override fun onBind(p0: Intent?): IBinder = binder

    override fun onDestroy() {
        // Cancel all coroutines
        serviceScope.cancel()
        mainHandler.removeCallbacksAndMessages(null)
        application.unregisterActivityLifecycleCallbacks(appLifecycleCallbacks)
        copycatStorage.removeDetectionModeListener(detectionModeNotificationListener)
        
        clipboardManager.removePrimaryClipChangedListener(onClipChangeListener)
        ServiceCompat.stopForeground(this, ServiceCompat.STOP_FOREGROUND_REMOVE)
        debugLog(logTag) { "CopyCatClipboardService Destroyed" }
        showAck("CopyCat Clipboard Stopped")
        isRunning = false
        copycatStorage.clean()
        
        // Clear references to prevent memory leaks
        lastCopiedText = null
        lastAckToastPackage = ""
        lastAckToastAtMs = 0L
        
        super.onDestroy()
    }

}