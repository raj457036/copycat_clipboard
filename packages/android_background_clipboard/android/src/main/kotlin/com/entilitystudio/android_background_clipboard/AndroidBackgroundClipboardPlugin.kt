package com.entilitystudio.android_background_clipboard

import android.app.Activity
import android.app.Application
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.File
import java.io.FileOutputStream


/** AndroidBackgroundClipboardPlugin */
class AndroidBackgroundClipboardPlugin : FlutterPlugin, MethodCallHandler,
    ActivityAware, PluginRegistry.ActivityResultListener,
    Application.ActivityLifecycleCallbacks,
    EventChannel.StreamHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var statusChannel: EventChannel
    private lateinit var peersChannel: EventChannel          // LAN peer discovery stream
    private lateinit var lanClipReceivedChannel: EventChannel // LAN clip received signal
    private lateinit var applicationContext: Context
    private var applicationActivity: Activity? = null
    private lateinit var storage: CopyCatSharedStorage
    private var application: Application? = null
    private val detectionStatusReporter = DetectionStatusReporter.getInstance()
    private var detectionStatusListener: ((Map<String, String>) -> Unit)? = null
    private var lanPeersStreamHandler: LanPeersStreamHandler? = null
    private var lanClipReceivedStreamHandler: LanClipReceivedStreamHandler? = null
    private var isEngineAttached: Boolean = false
    private var activityBinding: ActivityPluginBinding? = null
    private var batterySettingsResult: Result? = null
    private val batterySettingsRequestCode = 57241

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityBinding = binding
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activityBinding?.removeActivityResultListener(this)
        activityBinding = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        onDetachedFromActivityForConfigChanges()
        batterySettingsResult?.error("activity-detached", "Battery settings activity detached.", null)
        batterySettingsResult = null
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode != batterySettingsRequestCode) return false
        val pending = batterySettingsResult ?: return false
        batterySettingsResult = null
        pending.success(null)
        return true
    }

    private fun openBatterySettings(requestPermission: Boolean, result: Result) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            result.success(null)
            return
        }
        val activity = activityBinding?.activity
        if (activity == null) {
            result.error("no-activity", "Battery settings require an attached activity.", null)
            return
        }
        if (batterySettingsResult != null) {
            result.error("battery-settings-open", "Battery settings are already open.", null)
            return
        }
        batterySettingsResult = result
        try {
            if (requestPermission) {
                Utils.requestUnrestrictedBatteryAccess(applicationContext, activity, batterySettingsRequestCode)
            } else {
                Utils.openBatteryOptimizationSetting(applicationContext, activity, batterySettingsRequestCode)
            }
        } catch (error: Exception) {
            batterySettingsResult = null
            result.error("battery-settings-failed", error.message, null)
        }
    }


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        debugLog("CopyCat Service") { "onAttachedToEngine" }
        isEngineAttached = true
        Utils.isActivityOnTop = true
        channel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "copycat_clipboard")
        statusChannel = EventChannel(
            flutterPluginBinding.binaryMessenger,
            "copycat_clipboard/detection_status",
        )
        peersChannel = EventChannel(
            flutterPluginBinding.binaryMessenger,
            "copycat_clipboard/lan_peers",
        )
        lanClipReceivedChannel = EventChannel(
            flutterPluginBinding.binaryMessenger,
            "copycat_clipboard/lan_clip_received",
        )
        lanPeersStreamHandler = LanPeersStreamHandler()
        lanClipReceivedStreamHandler = LanClipReceivedStreamHandler()
        channel.setMethodCallHandler(this)
        statusChannel.setStreamHandler(this)
        peersChannel.setStreamHandler(lanPeersStreamHandler)
        lanClipReceivedChannel.setStreamHandler(lanClipReceivedStreamHandler)
        applicationContext = flutterPluginBinding.applicationContext
        storage = CopyCatSharedStorage.getInstance(applicationContext)

        // Register lifecycle callbacks
        application = flutterPluginBinding.applicationContext as Application
        application?.registerActivityLifecycleCallbacks(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "initStorage" -> {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    storage.keystore.generateKey()
                }
                result.success(null)
            }

            "clearStorage" -> {
                storage.clear()
                result.success(null)
            }

            "readShared" -> {
                val key = call.argument<String>("key")
                val type = call.argument<String>("type")
                val secure = call.argument<Boolean?>("secure") ?: false
                if (key == null) {
                    result.success(null)
                    return
                }
                if (secure) {
                    val value = storage.readSecure(key)
                    result.success(value)
                } else if (key.startsWith("Clip-")) {
                    val value = storage.readClip(key)
                    result.success(value?.toMap())
                }
                else {
                    val value = storage.read(key, type ?: "string")
                    result.success(value)
                }
            }

            "readAllClips" -> {
                val values = storage.readAllClips().map { it.toMap() }
                result.success(values)
            }

            "writeShared" -> {
                val key = call.argument<String>("key")
                val value = call.argument<Any>("value")
                val secure = call.argument<Boolean?>("secure") ?: false
                if (key == null || value == null) {
                    result.success(false)
                    return
                }
                if (secure) {
                    if (value !is String) {
                        result.error(
                            "invalid-value",
                            "Secure value must be a String.",
                            null
                        )
                        return
                    }
                    storage.writeSecure(key, value)
                } else {
                    storage.write(key, value)
                }
                result.success(true)
            }

            "deleteShared" -> {
                val keys = call.argument<List<String>>("keys")
                if (keys != null)
                    storage.delete(keys)
                result.success(null)
            }

            "isAccessibilityPermissionGranted" -> {
                val granted = Utils.isAccessibilityServiceEnabled(
                    applicationContext,
                    CopyCatAccessibilityService::class.java
                )
                result.success(granted)
            }

            "openAccessibilityService" -> {
                Utils.requestAccessibilityPermission(applicationContext, applicationActivity)
                result.success(null)
            }

            "isOverlayPermissionGranted" -> {
                val granted = Utils.isOverlayPermissionGranted(applicationContext)
                result.success(granted)
            }

            "requestOverlayPermission" -> {
                Utils.requestOverlayPermission(applicationContext, applicationActivity)
                result.success(null)
            }

            "isBatteryOptimizationEnabled" -> {
                val enabled = Utils.isBatteryOptimizationEnabled(applicationContext)
                result.success(enabled)
            }

            "requestUnrestrictedBatteryAccess" -> {
                openBatterySettings(true, result)
            }

            "openBatteryOptimizationSetting" -> {
                openBatterySettings(false, result)
            }

            "isNotificationPermissionGranted" -> {
                val granted = Utils.isNotificationPermissionGranted(applicationContext)
                result.success(granted)
            }

            "requestNotificationPermission" -> {
                Utils.requestNotificationPermission(applicationContext, applicationActivity)
                result.success(null)
            }

            "openNotificationSetting" -> {
                Utils.openNotificationSetting(applicationContext, applicationActivity)
                result.success(null)
            }

            "isServiceRunning" -> {
                val isRunning = CopyCatClipboardService.isRunning
                result.success(isRunning)
            }

            "getCachedPackageIconPath" -> {
                val packageName = call.argument<String>("packageName")
                result.success(getCachedPackageIconPath(packageName))
            }

            "broadcastClip" -> {
                @Suppress("UNCHECKED_CAST")
                val data = call.arguments as? Map<String, Any?> ?: emptyMap()
                // Run on a background thread — network I/O.
                Thread {
                    storage.broadcastForegroundClip(data)
                }.start()
                result.success(null)
            }

            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        debugLog("CopyCat Service") { "onDetachedFromEngine" }
        isEngineAttached = false
        clearDetectionStatusListener()
        lanPeersStreamHandler?.dispose()
        lanPeersStreamHandler = null
        lanClipReceivedStreamHandler?.dispose()
        lanClipReceivedStreamHandler = null
        channel.setMethodCallHandler(null)
        statusChannel.setStreamHandler(null)
        peersChannel.setStreamHandler(null)
        lanClipReceivedChannel.setStreamHandler(null)
        Utils.isActivityOnTop = false
        application?.unregisterActivityLifecycleCallbacks(this)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        clearDetectionStatusListener()
        if (events == null) return

        val listener: (Map<String, String>) -> Unit = listener@{ payload ->
            if (!isEngineAttached) return@listener
            try {
                events.success(payload)
            } catch (e: Exception) {
                debugLog("CopyCat Service") {
                    "Failed to emit detection status event after engine detach: ${e.message}"
                }
                clearDetectionStatusListener()
            }
        }
        detectionStatusListener = listener
        detectionStatusReporter.addListener(listener)
    }

    override fun onCancel(arguments: Any?) {
        clearDetectionStatusListener()
    }

    private fun clearDetectionStatusListener() {
        detectionStatusListener?.let { listener ->
            detectionStatusReporter.removeListener(listener)
        }
        detectionStatusListener = null
    }

    private fun getCachedPackageIconPath(packageName: String?): String? {
        val normalizedPackage = packageName?.trim().orEmpty()
        if (normalizedPackage.isEmpty()) return null

        val iconDir = File(applicationContext.cacheDir, "package_icons").also {
            if (!it.exists()) {
                it.mkdirs()
            }
        }
        val iconFile = File(iconDir, "$normalizedPackage.png")
        if (iconFile.exists() && iconFile.length() > 0L) {
            return iconFile.absolutePath
        }
        if (iconFile.exists() && iconFile.length() <= 0L) {
            iconFile.delete()
        }

        return try {
            val drawable = applicationContext.packageManager.getApplicationIcon(normalizedPackage)
            val bitmap = drawableToBitmap(drawable)
            FileOutputStream(iconFile).use { output ->
                if (!bitmap.compress(Bitmap.CompressFormat.PNG, 100, output)) {
                    iconFile.delete()
                    return null
                }
                output.flush()
            }
            iconFile.absolutePath
        } catch (_: PackageManager.NameNotFoundException) {
            null
        } catch (e: Exception) {
            debugLog("CopyCat Service") {
                "Failed to cache package icon for $normalizedPackage: ${e.message}"
            }
            iconFile.delete()
            null
        }
    }

    private fun drawableToBitmap(drawable: Drawable): Bitmap {
        if (drawable is BitmapDrawable) {
            drawable.bitmap?.let { return it }
        }

        val width = drawable.intrinsicWidth.takeIf { it > 0 } ?: 1
        val height = drawable.intrinsicHeight.takeIf { it > 0 } ?: 1
        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        drawable.setBounds(0, 0, canvas.width, canvas.height)
        drawable.draw(canvas)
        return bitmap
    }

    // Life Cycle events
    override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {
        Utils.isActivityOnTop = true
        applicationActivity = activity
        debugLog("ActivityLifecycle") {
            "onActivityCreated: ${activity.localClassName}, isActivityOnTop set to true"
        }
    }

    override fun onActivityStarted(activity: Activity) {
        Utils.isActivityOnTop = true
        applicationActivity = activity
        debugLog("ActivityLifecycle") {
            "onActivityStarted: ${activity.localClassName}, isActivityOnTop set to true"
        }
    }

    override fun onActivityResumed(activity: Activity) {
        Utils.isActivityOnTop = true
        applicationActivity = activity
        debugLog("ActivityLifecycle") {
            "onActivityResumed: ${activity.localClassName}, isActivityOnTop set to true"
        }
    }

    override fun onActivityPaused(activity: Activity) {
        Utils.isActivityOnTop = false
        applicationActivity = activity
        debugLog("ActivityLifecycle") {
            "onActivityPaused: ${activity.localClassName}, isActivityOnTop set to false"
        }
    }

    override fun onActivityStopped(activity: Activity) {
        Utils.isActivityOnTop = false
        applicationActivity = null
        debugLog("ActivityLifecycle") {
            "onActivityStopped: ${activity.localClassName}, isActivityOnTop set to false"
        }
    }

    override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {
        debugLog("ActivityLifecycle") {
            "onActivitySaveInstanceState: ${activity.localClassName}, no change to isActivityOnTop"
        }
    }

    override fun onActivityDestroyed(activity: Activity) {
        Utils.isActivityOnTop = false
        applicationActivity = null
        debugLog("ActivityLifecycle") {
            "onActivityDestroyed: ${activity.localClassName}, isActivityOnTop set to false"
        }
    }

    /**
     * EventChannel.StreamHandler for the `copycat_clipboard/lan_clip_received` channel.
     *
     * Sends the clip key (e.g. "Clip-8") each time a LAN clip is written to shared
     * storage. Flutter reads that single clip directly without a full batch scan.
     */
    private inner class LanClipReceivedStreamHandler : EventChannel.StreamHandler {
        private val reporter = LanClipReceivedReporter.getInstance()
        private var listener: ((String) -> Unit)? = null

        override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
            listener?.let { reporter.removeListener(it) }
            if (events == null) return
            val l: (String) -> Unit = l@{ clipKey ->
                if (!isEngineAttached) return@l
                try {
                    events.success(clipKey)
                } catch (e: Exception) {
                    debugLog("CopyCat Service") {
                        "Failed to emit LAN clip received event after engine detach: ${e.message}"
                    }
                    dispose()
                }
            }
            listener = l
            reporter.addListener(l)
        }

        override fun onCancel(arguments: Any?) {
            dispose()
        }

        fun dispose() {
            listener?.let { reporter.removeListener(it) }
            listener = null
        }
    }

    /**
     * EventChannel.StreamHandler for the `copycat_clipboard/lan_peers` channel.
     *
     *      Bridges [LanPeerReporter] updates to Flutter.
     *          The explicitly calls [dispose] during engine detach to ensure listener cleanup
     *          even if Flutter stream cancellation does not arrive during hot restart.
     */
    private inner class LanPeersStreamHandler : EventChannel.StreamHandler {
        private val reporter = LanPeerReporter.getInstance()
        private var listener: ((List<Map<String, String>>) -> Unit)? = null

        override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
            // Cancel any previous subscription first (safety guard against double-listen)
            listener?.let { reporter.removeListener(it) }
            if (events == null) return
            val l: (List<Map<String, String>>) -> Unit = l@{ payload ->
                if (!isEngineAttached) return@l
                try {
                    events.success(payload)
                } catch (e: Exception) {
                    debugLog("CopyCat Service") {
                        "Failed to emit LAN peer event after engine detach: ${e.message}"
                    }
                    dispose()
                }
            }
            listener = l
            reporter.addListener(l)
        }

        override fun onCancel(arguments: Any?) {
            dispose()
        }

        fun dispose() {
            listener?.let { reporter.removeListener(it) }
            listener = null
        }
    }
}
