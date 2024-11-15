package com.entilitystudio.android_background_clipboard

import CopyCatKeyStore
import android.content.Context
import android.content.Context.MODE_PRIVATE
import android.content.SharedPreferences.OnSharedPreferenceChangeListener
import android.os.Build
import android.util.Base64
import android.util.Log


enum class ClipType {
    Text,
    Url,
    Email,
    Phone,
    FileUrl
}

class CopyCatSharedStorage private constructor(applicationContext: Context) {
    private var sp = applicationContext.getSharedPreferences("CopyCatSharedPreferences", MODE_PRIVATE)
    private var sharedAccessKey: String? = null
    private var syncEnabled: Boolean = false
    private lateinit var deviceId: String
    private var endId: Int = -1

    var excludedPackages: Set<String> = emptySet()
    var strictCheck = false
    var showAckToast = true

    val keystore: CopyCatKeyStore
        get() = CopyCatKeyStore.getInstance()

    private val listener = OnSharedPreferenceChangeListener { sharedPreferences, key ->
        if (key == "strictCheck") {
            strictCheck = sharedPreferences.getBoolean(key, false)
        }
        if (key == "showAckToast") {
            showAckToast = sharedPreferences.getBoolean(key, true)
        }
        if (key == "sharedAccessKey") {
            readSecure(key)?.let {
                sharedAccessKey = it
            }
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
        sp.registerOnSharedPreferenceChangeListener(listener)
    }

    fun readSecure(key: String): String? {
        val encrypted = sp.getString(key, "").toString()
        if (encrypted.isNotBlank())
        {
            val decoded = Base64.decode(encrypted, Base64.DEFAULT)
            return keystore.decryptData(decoded)
        }
        return null
    }

    fun writeSecure(key: String, value: String) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val encrypted = keystore.encryptData(value)
            val encoded = Base64.encodeToString(encrypted, Base64.DEFAULT)
            val editor = sp.edit()
            editor.putString(key, encoded)
            editor.apply()
        }
    }

    private fun readConfig() {
        readSecure("sharedAccessKey")?.let {
            sharedAccessKey = it
        }

        syncEnabled = sp.getBoolean("syncEnabled", false)
        deviceId = sp.getString("deviceId", "").toString()
        endId = sp.getInt("endId", -1)

        excludedPackages = sp.getStringSet("excludedPackages", emptySet())!!
        strictCheck = sp.getBoolean("strictCheck", false)
        showAckToast = sp.getBoolean("showAckToast", true)
    }

    private fun getNextId(): String {
        return "Clip-${endId + 1}"
    }

    fun write(key: String, value: Any) {
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

    fun writeTextClip(text: String, type: ClipType, desc: String? = null) {
        val nextId = getNextId()
        endId += 1  // Update endId for next usage
        val editor = sp.edit()
        editor.putString(nextId, text)
        editor.putString("$nextId-meta", "$type :: $desc :: ")
        editor.putInt("endId", endId) // Persist updated endId in SharedPreferences
        editor.apply()
        writeTextClipToServer(text, type)
    }

    private fun writeTextClipToServer(text: String, type: ClipType) {
        Log.d("CopyCatSharedStorage", "Writing text clip to server")
    }

    fun clean() {
        sp.unregisterOnSharedPreferenceChangeListener(listener)
    }
}