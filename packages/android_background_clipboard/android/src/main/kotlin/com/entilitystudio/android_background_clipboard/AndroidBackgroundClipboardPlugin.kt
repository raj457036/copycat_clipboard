package com.entilitystudio.android_background_clipboard

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.provider.Settings
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** AndroidBackgroundClipboardPlugin */
class AndroidBackgroundClipboardPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var applicationContext: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_background_clipboard")
    channel.setMethodCallHandler(this)
    applicationContext = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "isAccessibilityPermissionGranted" -> {
        val granted = Utils.isAccessibilityServiceEnabled(
          applicationContext,
          CopyCatAccessibilityService::class.java
        )
        result.success(granted)
      }
      "openAccessibilityService" -> {
        val intent = Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        applicationContext.startActivity(intent)
        result.success(null)
      }
      "isOverlayPermissionGranted" -> {
        val granted = Utils.isOverlayPermissionGranted(applicationContext)
        result.success(granted)
      }
      "requestOverlayPermission" -> {
        Utils.requestOverlayPermission(applicationContext)
        result.success(null)
      }
      "isBatteryOptimizationEnabled" -> {
        val enabled = Utils.isBatteryOptimizationEnabled(applicationContext)
        result.success(enabled)
      }
      "requestUnrestrictedBatteryAccess" -> {
        Utils.requestUnrestrictedBatteryAccess(applicationContext)
        result.success(null)
      }
      "isNotificationPermissionGranted" -> {
        val granted = Utils.isNotificationPermissionGranted(applicationContext)
        result.success(granted)
      }
      "requestNotificationPermission" -> {
        Utils.requestNotificationPermission(applicationContext)
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
}
