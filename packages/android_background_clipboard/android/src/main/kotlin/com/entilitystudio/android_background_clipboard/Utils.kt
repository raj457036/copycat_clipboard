package com.entilitystudio.android_background_clipboard

import android.Manifest
import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.AccessibilityServiceInfo
import android.app.Activity
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.content.Intent.FLAG_ACTIVITY_NEW_TASK
import android.content.pm.PackageManager
import android.content.pm.ServiceInfo
import android.net.Uri
import android.os.Build
import android.os.PowerManager
import android.provider.Settings
import android.view.accessibility.AccessibilityManager
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat


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

        fun requestAccessibilityPermission(context: Context, activity: Activity?) {
            if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.M) return

            val intent = Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)

            if (activity != null) {
                activity.startActivityForResult(intent, 100)
            } else {
                intent.addFlags(FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
            }
        }

        fun isOverlayPermissionGranted(context: Context?): Boolean {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                return Settings.canDrawOverlays(context)
            }
            return false
        }

        fun requestOverlayPermission(context: Context, activity: Activity?) {
            if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.M)  return
            val intent = Intent(
                Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                Uri.parse("package:" + context.packageName)
            )
            if (activity != null) {
                activity.startActivityForResult(intent, 100)
            }
            else {
                intent.addFlags(FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
            }
        }

        fun isBatteryOptimizationEnabled(context: Context): Boolean {
            if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.M)  return false
            val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
            val ignoring = powerManager.isIgnoringBatteryOptimizations(context.packageName)
            return !ignoring
        }

        fun requestUnrestrictedBatteryAccess(context: Context, activity: Activity?) {
            if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.M) return

            val packageName = context.packageName
            val pm = context.getSystemService(Context.POWER_SERVICE) as PowerManager

            val intent: Intent = if (!pm.isIgnoringBatteryOptimizations(packageName)) {
                // Request battery optimization exemption for the app
                Intent(
                    Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
                    Uri.parse("package:$packageName")
                )
            } else {
                // Open general battery optimization settings
                Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)
            }

            if (activity != null) {
                activity.startActivityForResult(intent, 1001)
            } else {
                intent.addFlags(FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
            }
        }


        fun isNotificationPermissionGranted(context: Context): Boolean {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                val notificationManager = context.getSystemService(NotificationManager::class.java)
                return notificationManager?.areNotificationsEnabled() == true
            }
            // For older Android versions, notifications are enabled by default
            return true
        }

        @RequiresApi(Build.VERSION_CODES.O)
        fun openNotificationSetting(context: Context, activity: Activity?) {
            val intent = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS).apply {
                putExtra(Settings.EXTRA_APP_PACKAGE, context.packageName)
            }

            if (activity != null) {
                activity.startActivityForResult(intent, 1200)
            } else {
                intent.addFlags(FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
            }
        }

        fun requestNotificationPermission(context: Context, activity: Activity?) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && activity != null) {
                val status = ActivityCompat.checkSelfPermission(context, Manifest.permission.POST_NOTIFICATIONS)
                val notDeclinedYet = ActivityCompat.shouldShowRequestPermissionRationale(activity, Manifest.permission.POST_NOTIFICATIONS)
                if (status != PackageManager.PERMISSION_GRANTED && !notDeclinedYet) {
                    ActivityCompat.requestPermissions(activity, arrayOf(Manifest.permission.POST_NOTIFICATIONS), 101) // random request code
                } else {
                    openNotificationSetting(context, activity)
                }
            } else {
                openNotificationSetting(context, activity)
            }
        }
    }
}