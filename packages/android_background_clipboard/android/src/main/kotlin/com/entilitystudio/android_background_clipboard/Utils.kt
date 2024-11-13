package com.entilitystudio.android_background_clipboard

import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.AccessibilityServiceInfo
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.content.Intent.FLAG_ACTIVITY_NEW_TASK
import android.content.pm.ServiceInfo
import android.net.Uri
import android.os.Build
import android.os.PowerManager
import android.provider.Settings
import android.view.accessibility.AccessibilityManager


class Utils {

    companion object {
        fun isAccessibilityServiceEnabled(
            context: Context,
            service: Class<out AccessibilityService?>
        ): Boolean {
            val am = context.getSystemService(Context.ACCESSIBILITY_SERVICE) as AccessibilityManager
            val enabledServices =
                am.getEnabledAccessibilityServiceList(AccessibilityServiceInfo.FEEDBACK_ALL_MASK)
            for (enabledService in enabledServices) {
                val enabledServiceInfo: ServiceInfo = enabledService.resolveInfo.serviceInfo
                if (enabledServiceInfo.packageName.equals(context.packageName) && enabledServiceInfo.name.equals(
                        service.name
                    )
                ) return true
            }
            return false
        }

        fun isOverlayPermissionGranted(context: Context?): Boolean {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                return Settings.canDrawOverlays(context)
            }
            return false
        }

        fun requestOverlayPermission(context: Context?) {
            if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.M)  return;
            val intent = Intent(
                Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                Uri.parse("package:" + context?.packageName)
            ).apply {
                flags = FLAG_ACTIVITY_NEW_TASK
            }
            context?.startActivity(intent)
        }

        fun isBatteryOptimizationEnabled(context: Context): Boolean {
            if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.M)  return false
            val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
            val ignoring = powerManager.isIgnoringBatteryOptimizations(context.packageName)
            return !ignoring
        }

        fun requestUnrestrictedBatteryAccess(context: Context) {
            if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.M)  return
            val intent = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS).apply {
                flags = FLAG_ACTIVITY_NEW_TASK
            }
            context.startActivity(intent)
        }

        fun isNotificationPermissionGranted(context: Context): Boolean {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                val notificationManager = context.getSystemService(
                    NotificationManager::class.java
                )
                return notificationManager != null && notificationManager.areNotificationsEnabled()
            }

            return true
        }

        fun requestNotificationPermission(context: Context) {
            if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.O)  return
            val intent = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS).apply {
                flags = FLAG_ACTIVITY_NEW_TASK
            }
            intent.putExtra(Settings.EXTRA_APP_PACKAGE, context.packageName)
            context.startActivity(intent)
        }
    }
}