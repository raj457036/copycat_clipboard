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
import android.util.Log
import android.view.accessibility.AccessibilityManager
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import com.aventrix.jnanoid.jnanoid.NanoIdUtils

inline fun debugLog(tag: String, message: () -> String) {
    Log.d(tag, message())
}

private const val ORIGIN_ID_LENGTH = 11

/**
 * Generates a short NanoID for LAN/sync origin deduplication.
 */
fun generateOriginId(): String = NanoIdUtils.randomNanoId(
    NanoIdUtils.DEFAULT_NUMBER_GENERATOR,
    NanoIdUtils.DEFAULT_ALPHABET,
    ORIGIN_ID_LENGTH,
)

class Utils {

    companion object {
        var isActivityOnTop: Boolean = false
        
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
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return

            val intent = Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)

            if (activity != null) {
                activity.startActivity(intent)
                Toast.makeText(context, "Grant CopyCat accessibility permission", Toast.LENGTH_LONG).show()
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
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return
            val intent = Intent(
                Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                Uri.parse("package:" + context.packageName)
            )

            if (activity != null) {
                activity.startActivity(intent)
            } else {
                intent.addFlags(FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
            }
        }

        fun isBatteryOptimizationEnabled(context: Context): Boolean {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return false
            val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
            val ignoring = powerManager.isIgnoringBatteryOptimizations(context.packageName)
            return !ignoring
        }

        fun requestUnrestrictedBatteryAccess(context: Context, activity: Activity?, requestCode: Int? = null) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return

            val packageName = context.packageName
            val pm = context.getSystemService(Context.POWER_SERVICE) as PowerManager

            if (pm.isIgnoringBatteryOptimizations(packageName)) {
                openBatteryOptimizationSetting(context, activity, requestCode)
                return
            }

            val intent = Intent(
                Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
                Uri.parse("package:$packageName")
            )

            if (activity != null) {
                if (requestCode != null) {
                    activity.startActivityForResult(intent, requestCode)
                } else {
                    activity.startActivity(intent)
                }
            } else {
                intent.addFlags(FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
            }
        }

        fun openBatteryOptimizationSetting(context: Context, activity: Activity?, requestCode: Int? = null) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return

            val intent = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)

            if (activity != null) {
                if (requestCode != null) {
                    activity.startActivityForResult(intent, requestCode)
                } else {
                    activity.startActivity(intent)
                }
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
                activity.startActivity(intent)
            } else {
                intent.addFlags(FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
            }
        }

        fun requestNotificationPermission(context: Context, activity: Activity?) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && activity != null) {
                val status = ActivityCompat.checkSelfPermission(
                    context,
                    Manifest.permission.POST_NOTIFICATIONS
                )
                if (status != PackageManager.PERMISSION_GRANTED) {
                    ActivityCompat.requestPermissions(
                        activity,
                        arrayOf(Manifest.permission.POST_NOTIFICATIONS),
                        101
                    ) // random request code
                }
            }
        }
    }
}