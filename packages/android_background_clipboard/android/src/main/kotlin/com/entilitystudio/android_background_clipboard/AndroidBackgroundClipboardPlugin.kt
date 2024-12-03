package com.entilitystudio.android_background_clipboard

import android.app.Activity
import android.app.Application
import android.content.Context
import android.os.Build
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** AndroidBackgroundClipboardPlugin */
class AndroidBackgroundClipboardPlugin: FlutterPlugin, MethodCallHandler,
  Application.ActivityLifecycleCallbacks {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var applicationContext: Context
  private var applicationActivity: Activity? = null
  private lateinit var storage: CopyCatSharedStorage
  private var application: Application? = null


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    Log.d("CopyCat Service", "onAttachedToEngine")
    Utils.isActivityOnTop = true
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_background_clipboard")
    channel.setMethodCallHandler(this)
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
        } else {
          val value = storage.read(key, type ?: "string")
          result.success(value)
        }
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
        Utils.requestUnrestrictedBatteryAccess(applicationContext, applicationActivity)
        result.success(null)
      }
      "isNotificationPermissionGranted" -> {
        val granted = Utils.isNotificationPermissionGranted(applicationContext)
        result.success(granted)
      }
      "requestNotificationPermission" -> {
        Utils.requestNotificationPermission(applicationContext, applicationActivity)
        result.success(null)
      }
      "isServiceRunning" -> {
        val isRunning = CopyCatClipboardService.isRunning
        result.success(isRunning)
      }
      else ->  result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    Log.d("CopyCat Service", "onDetachedFromEngine")
    channel.setMethodCallHandler(null)
    Utils.isActivityOnTop = false
    application?.unregisterActivityLifecycleCallbacks(this)
  }

  // Life Cycle events
  override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {
    Utils.isActivityOnTop = true
    applicationActivity = activity
    Log.d("ActivityLifecycle", "onActivityCreated: ${activity.localClassName}, isActivityOnTop set to true")
  }

  override fun onActivityStarted(activity: Activity) {
    Utils.isActivityOnTop = true
    applicationActivity = activity
    Log.d("ActivityLifecycle", "onActivityStarted: ${activity.localClassName}, isActivityOnTop set to true")
  }

  override fun onActivityResumed(activity: Activity) {
    Utils.isActivityOnTop = true
    applicationActivity = activity
    Log.d("ActivityLifecycle", "onActivityResumed: ${activity.localClassName}, isActivityOnTop set to true")
  }

  override fun onActivityPaused(activity: Activity) {
    Utils.isActivityOnTop = false
    applicationActivity = activity
    Log.d("ActivityLifecycle", "onActivityPaused: ${activity.localClassName}, isActivityOnTop set to false")
  }

  override fun onActivityStopped(activity: Activity) {
    Utils.isActivityOnTop = false
    applicationActivity = null
    Log.d("ActivityLifecycle", "onActivityStopped: ${activity.localClassName}, isActivityOnTop set to false")
  }

  override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {
    Log.d("ActivityLifecycle", "onActivitySaveInstanceState: ${activity.localClassName}, no change to isActivityOnTop")
  }

  override fun onActivityDestroyed(activity: Activity) {
    Utils.isActivityOnTop = false
    applicationActivity = null
    Log.d("ActivityLifecycle", "onActivityDestroyed: ${activity.localClassName}, isActivityOnTop set to false")
  }
}
