package com.entilitystudio.android_background_clipboard

import android.content.Context
import android.content.Context.MODE_PRIVATE
import android.content.SharedPreferences.OnSharedPreferenceChangeListener
import android.os.Build
import android.util.Base64
import android.util.Log
import java.lang.Exception

class CopyCatSharedStorage private constructor(applicationContext: Context) {
    private val logTag = "CopyCatSharedStorage"
    private val sp = applicationContext.getSharedPreferences("CopyCatSharedPreferences", MODE_PRIVATE)
    private var syncEnabled: Boolean = false
    private lateinit var deviceId: String
    private var endId: Int = -1
    private var syncManager: CopyCatSyncManager = CopyCatSyncManager(applicationContext)

    var excludedPackages: Set<String> = emptySet()
    var strictCheck = false
    var showAckToast = true
    var serviceEnabled: Boolean = false

    val keystore: CopyCatKeyStore
        get() = CopyCatKeyStore.getInstance()

    private val listener = OnSharedPreferenceChangeListener { sharedPreferences, key ->
        if (key == "strictCheck") {
            strictCheck = sharedPreferences.getBoolean(key, false)
        }
        if (key == "showAckToast") {
            showAckToast = sharedPreferences.getBoolean(key, true)
        }
        if (key == "serviceEnabled") {
            serviceEnabled = sharedPreferences.getBoolean(key, false)
        }
        if (key == "projectKey") {
            readSecure(key)?.let {
                syncManager.projectKey = it
            }
        }
        if (key == "projectApiKey") {
            readSecure(key)?.let {
                syncManager.projectApiKey = it
            }
        }
        if (key == "deviceId") {
            deviceId = sharedPreferences.getString("deviceId", "").toString()
            syncManager.deviceId = deviceId
        }
    }

    companion object {
        @Volatile
        private var instance: CopyCatSharedStorage? = null
        fun getInstance(applicationContext: Context): CopyCatSharedStorage {
            return instance ?: synchronized(this) {
                instance ?: CopyCatSharedStorage(applicationContext).also { instance = it }
            }
        }
    }

    fun start() {
        readConfig()
        syncManager.start()
        sp.registerOnSharedPreferenceChangeListener(listener)
    }

    fun readSecure(key: String): String? {
        Log.d(logTag, "Reading $key from secure storage")
        val encrypted = sp.getString(key, "").toString()
        if (encrypted.isNotBlank())
        {
            val decoded = Base64.decode(encrypted, Base64.DEFAULT)
            return keystore.decryptData(decoded)
        }
        Log.d(logTag, "$key not found in secure storage")
        return null
    }

    fun clear() {
        Log.d(logTag, "Clearing storage")
        sp.edit().clear().apply()
    }

    fun writeSecure(key: String, value: String) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            Log.d(logTag, "Writing $key to secure storage")
            val encrypted = keystore.encryptData(value)
            val encoded = Base64.encodeToString(encrypted, Base64.DEFAULT)
            val editor = sp.edit()
            editor.putString(key, encoded)
            editor.apply()
        }
    }

    private fun readConfig() {
        Log.d(logTag, "Reading initial setup configs")
        syncEnabled = sp.getBoolean("syncEnabled", false)
        deviceId = sp.getString("deviceId", "").toString()
        endId = sp.getInt("endId", -1)

        excludedPackages = sp.getStringSet("excludedPackages", emptySet())!!
        strictCheck = sp.getBoolean("strictCheck", false)
        showAckToast = sp.getBoolean("showAckToast", true)
        serviceEnabled = sp.getBoolean("serviceEnabled", false)

        readSecure("projectKey")?.let {
            syncManager.projectKey = it
        }
        readSecure("projectApiKey")?.let {
            syncManager.projectApiKey = it
        }

        syncManager.deviceId = deviceId
    }

    private fun getNextId(): String {
        return "Clip-${endId + 1}"
    }

    fun write(key: String, value: Any) {
        Log.d(logTag, "Writing $key = $value to storage")
        val editor = sp.edit()
        when (value) {
            is String -> {
                editor.putString(key, value)
            }
            is Int -> {
                editor.putInt(key, value)
            }
            is Boolean -> {
                editor.putBoolean(key, value)
            }
        }
        editor.apply()
    }

    fun read(key: String, type: String): Any? {
        Log.d(logTag, "Reading $key of type $type from storage")
        return when (type) {
            "string" -> sp.getString(key, "")
            "int" ->  sp.getInt(key, 0)
            "bool" -> sp.getBoolean(key, false)
            else -> null
        }

    }

    fun delete(keys: Iterable<String>) {
        val editor = sp.edit()
        for (key in keys) {
            editor.remove(key)
        }
        editor.apply()

    }

    fun writeTextClip(text: String, type: ClipType, desc: String = "") {
        if (!serviceEnabled) return
        val nextId = getNextId()
        endId += 1  // Update endId for next usage
        val editor = sp.edit()
        editor.putString(nextId, text)
        // type::description::serverId
        editor.putString("$nextId-meta", "$type::$desc::::")
        editor.putInt("endId", endId)
        editor.apply()
        writeTextClipToServer(text, type, "$nextId-meta")
    }

    private fun updateClipId(key: String, id: Long, userId: String) {
        var meta = sp.getString(key, "")!!
        if (meta.isBlank()) return
        val parts = meta.split("::", limit = 4).toMutableList()
        parts[2] = id.toString()
        parts[3] = userId
        meta = parts.joinToString("::")
        sp.edit().putString(key, meta).apply()
    }

    private fun writeTextClipToServer(text: String, type: ClipType, metaKey: String) {
        Log.d(logTag, "Writing text clip to server")
        if (!syncEnabled || !serviceEnabled) {
            Log.d(logTag, "Sync Disabled or Service is not enabled.")
            return
        }

        if (syncManager.isStopped) {
            Log.d(logTag, "Sync service stopped")
            return
        }

        try {
            val id = syncManager.writeClipboardItem(text, type)
            if (id != (-1).toLong()) {
                updateClipId(metaKey, id, syncManager.currentUserId!!)
            }
        } catch (e: Exception) {
            Log.e(logTag, "Error while syncing clip $e")
        }
    }

    fun clean() {
        syncManager.stop()
        sp.unregisterOnSharedPreferenceChangeListener(listener)
    }
}