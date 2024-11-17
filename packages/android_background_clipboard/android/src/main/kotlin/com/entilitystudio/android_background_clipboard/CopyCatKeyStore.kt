package com.entilitystudio.android_background_clipboard

import android.os.Build
import android.security.keystore.KeyGenParameterSpec
import android.security.keystore.KeyProperties
import androidx.annotation.RequiresApi
import java.security.KeyStore
import javax.crypto.Cipher
import javax.crypto.KeyGenerator
import javax.crypto.SecretKey
import javax.crypto.spec.GCMParameterSpec

class CopyCatKeyStore private constructor() {
    private val keyStore: KeyStore = KeyStore.getInstance("AndroidKeyStore").apply {
        load(null)
    }

    companion object {
        private const val AES_MODE = "AES/GCM/NoPadding"

        private const val GCM_TAG_LENGTH = 128 // in bits
        private const val IV_LENGTH = 12

        private const val KEY_ALIAS = "copycat_secret_key"

        @Volatile
        private var instance: CopyCatKeyStore? = null

        // Singleton instance
        fun getInstance(): CopyCatKeyStore {
            return instance ?: synchronized(this) {
                instance ?: CopyCatKeyStore().also { instance = it }
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.M)
    @Throws(Exception::class)
    fun generateKey() {
        // Check if the key already exists in Keystore
        if (keyStore.containsAlias(KEY_ALIAS)) return

        // Define the key generation specifications
        val keyGenParameterSpec = KeyGenParameterSpec.Builder(KEY_ALIAS,
            KeyProperties.PURPOSE_ENCRYPT or KeyProperties.PURPOSE_DECRYPT)
            .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
            .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
            .build()

        // Initialize the KeyGenerator with AES algorithm
        val keyGenerator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore")
        keyGenerator.init(keyGenParameterSpec)

        // Generate and store the key in Keystore
        keyGenerator.generateKey()
    }

    @Throws(Exception::class)
    fun getSecretKey(): SecretKey {
        if (!keyStore.containsAlias(KEY_ALIAS)) {
            throw IllegalStateException("Key does not exist in Keystore. Please generate the key first.")
        }
        val key = keyStore.getKey(KEY_ALIAS, null)
        return key as SecretKey
    }
    // Encrypt data
    fun encryptData(data: String): ByteArray {
        val cipher = Cipher.getInstance(AES_MODE)
        cipher.init(Cipher.ENCRYPT_MODE, getSecretKey())

        val iv = cipher.iv // Initialization vector (IV) generated during encryption
        val encryptedBytes = cipher.doFinal(data.toByteArray())

        // Combine IV and encrypted data
        return iv + encryptedBytes
    }

    // Decrypt data
    fun decryptData(encryptedData: ByteArray): String {

        if (encryptedData.size <= IV_LENGTH) {
            throw IllegalArgumentException("Invalid encrypted data format.")
        }
        
        // Split IV and encrypted data
        val iv = encryptedData.copyOfRange(0, IV_LENGTH)
        val encryptedBytes = encryptedData.copyOfRange(IV_LENGTH, encryptedData.size)

        val cipher = Cipher.getInstance(AES_MODE)
        val spec = GCMParameterSpec(GCM_TAG_LENGTH, iv)
        cipher.init(Cipher.DECRYPT_MODE, getSecretKey(), spec)

        val decryptedBytes = cipher.doFinal(encryptedBytes)
        return String(decryptedBytes)
    }
}
