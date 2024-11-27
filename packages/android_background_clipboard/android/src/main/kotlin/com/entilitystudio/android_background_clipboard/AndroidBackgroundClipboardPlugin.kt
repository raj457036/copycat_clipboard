package com.entilitystudio.android_background_clipboard

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Build
import android.provider.Settings
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** AndroidBackgroundClipboardPlugin */
class AndroidBackgroundClipboardPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var applicationContext: Context
  private var applicationActivity: Activity? = null
  private lateinit var storage: CopyCatSharedStorage

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_background_clipboard")
    channel.setMethodCallHandler(this)
    applicationContext = flutterPluginBinding.applicationContext
    storage = CopyCatSharedStorage.getInstance(applicationContext)
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
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    applicationActivity = binding.activity
    Utils.isActivityOnTop = true
  }

  override fun onDetachedFromActivityForConfigChanges() {
    applicationActivity = null
    Utils.isActivityOnTop = false
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    applicationActivity = binding.activity
    Utils.isActivityOnTop = true
  }

  override fun onDetachedFromActivity() {
    applicationActivity = null
    Utils.isActivityOnTop = false
  }
}
