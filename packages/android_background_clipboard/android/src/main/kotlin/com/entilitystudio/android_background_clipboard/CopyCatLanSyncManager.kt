package com.entilitystudio.android_background_clipboard

import android.content.BroadcastReceiver
import android.content.ClipData as AndroidClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import android.net.nsd.NsdManager
import android.net.nsd.NsdServiceInfo
import android.net.wifi.WifiManager
import android.os.SystemClock
import android.util.Log
import android.webkit.MimeTypeMap
import android.widget.Toast
import androidx.core.content.FileProvider
import okhttp3.Call
import okhttp3.Callback
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.Response
import org.json.JSONObject
import kotlinx.serialization.encodeToString
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.net.InetAddress
import java.net.ServerSocket
import java.net.Socket
import java.text.SimpleDateFormat
import java.util.concurrent.ArrayBlockingQueue
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.Executors
import java.util.concurrent.RejectedExecutionException
import java.util.concurrent.RejectedExecutionHandler
import java.util.Date
import java.util.Locale
import java.util.concurrent.TimeUnit
import java.util.concurrent.ThreadPoolExecutor
import java.util.TimeZone
import java.time.Instant
import java.security.MessageDigest
import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec

/** Payload delivered to the host when a LAN clip is received and should be persisted. */
data class LanClipPayload(
    val originId: String,
    val fromDeviceId: String,
    val type: ClipType,
    val content: String,
    val label: String,
    val timestamp: Long,
    val encrypted: Boolean,
    val locked: Boolean = false,
    val iv: String?,
    val encMode: String?,
    val userId: String? = null,
    val serverId: Long? = null,
    // File / media fields — null for text/url clips.
    val localFilePath: String? = null,
    val fileMimeType: String? = null,
    val fileExtension: String? = null,
    val fileName: String? = null,
    val fileSize: Long? = null,
    val sourceId: String? = null,
    val sourceApp: String? = null,
    val deleted: Boolean = false,
    val deletedAtMs: Long? = null,
    val title: String? = null,
    val description: String? = null,
)

private data class PeerAddress(val host: String, val port: Int, val os: String? = null) {
    val isDesktop: Boolean
        get() {
            val normalized = os?.trim()?.lowercase() ?: return false
            return normalized == "macos" || normalized == "windows" || normalized == "linux" || normalized == "darwin"
        }
}

/**
 * CopyCat LAN sync for Android.
 *
 * – Runs a bare [ServerSocket] on a daemon thread.
 * – Registers and discovers `_copycat._tcp` via [NsdManager].
 * – Authenticates with HMAC-SHA256(body + timestamp, userId).
 * – Text/URL clips -> [onLanClipReceived] for persistent storage.
 * – Media/file clips (when auto-write is enabled) -> written to cacheDir and
 *   placed directly on the Android clipboard via [ClipboardManager].
 */
class CopyCatLanSyncManager(
    private val appContext: Context,
    private val onLanClipReceived: (LanClipPayload) -> Unit,
    private val onBeforeClipboardWrite: (ByteArray) -> Unit = {},
    private val decryptContent: ((content: String, encMode: String?, iv: String?) -> String?)? = null,
) {
    companion object {
        private const val LOG_TAG = "CopyCatLanSyncManager"
        private const val REPLAY_WINDOW_MS = 10_000L
        private const val MAX_HEADER_LINE_BYTES = 8 * 1024
        private const val MAX_BODY_BYTES = 100 * 1024 * 1024
        private const val MAX_TEXT_BODY_BYTES = 512 * 1024
        private const val HMAC_ALGO = "HmacSHA256"
        private const val LAN_RECV_DIR = "lan_recv"
        private const val STREAM_BUFFER_BYTES = 64 * 1024
        private const val DISCOVERY_REFRESH_EMPTY_MS = 15_000L
        private const val DISCOVERY_REFRESH_STABLE_MS = 60_000L
        private const val DISCOVERY_POST_REGISTER_DELAY_MS = 1_200L
        private const val CACHED_PEERS_PREF_KEY = "lan_cached_peers"
        private const val MAX_SEND_RETRIES = 2
    }

    private val serviceType: String
        get() {
            if (userId.isEmpty()) return "_copycat._tcp."
            val hash = MessageDigest.getInstance("SHA-256").digest(userId.toByteArray(Charsets.UTF_8))
            val fp = hash.joinToString("") { "%02x".format(it) }.substring(0, 8)
            return "_cc-$fp._tcp."
        }

    // MARK: - Mutable Config
    var lanSyncEnabled: Boolean = false
    var deviceId: String = ""
    var userId: String = ""
        set(value) {
            val normalized = value.trim()
            val changed = field != normalized
            field = normalized
            if (changed && started) {
                Log.i(LOG_TAG, "User ID updated ($normalized), re-registering NSD with new serviceType ($serviceType)")
                mainHandler.post {
                    if (started && !nsdPaused) {
                        stopDiscovery()
                        unregisterNsd()
                        registerNsd()
                        discoverPeers()
                        scheduleDiscoveryRefresh()
                    }
                }
            }
        }
    var autoWriteOnReceive: Boolean = false
    var maxAutoCopyBytes: Int = 10 * 1024 * 1024

    // MARK: - Runtime State
    private var serverSocket: ServerSocket? = null
    private var serverThread: Thread? = null
    private var serverPort: Int = 0
    private var nsdManager: NsdManager? = null
    private var registrationListener: NsdManager.RegistrationListener? = null
    private var discoveryListener: NsdManager.DiscoveryListener? = null
    private val peers = ConcurrentHashMap<String, PeerAddress>() // key = deviceId
    // Tracks which mDNS service name resolved to which deviceId.
    // A single physical device may appear under two service names when mDNS
    // conflict-renames a re-registered service (e.g. "copycat-X (2)").
    private val serviceNameToDeviceId = ConcurrentHashMap<String, String>()
    private var started = false
    private var connectionExecutor: ThreadPoolExecutor? = null
    private val mainHandler = Handler(Looper.getMainLooper())
    private var lastErrorToastMessage: String = ""
    private var lastErrorToastAtMs: Long = 0L
    private val errorToastCooldownMs = 5000L
    private var multicastLock: WifiManager.MulticastLock? = null
    private val sp = appContext.getSharedPreferences("CopyCatSharedPreferences", Context.MODE_PRIVATE)

    private fun acquireMulticastLock() {
        if (multicastLock?.isHeld == true) return
        try {
            val wifi = appContext.applicationContext.getSystemService(Context.WIFI_SERVICE) as? WifiManager
            multicastLock = wifi?.createMulticastLock("copycat_lan_multicast")?.apply {
                setReferenceCounted(false)
                acquire()
            }
            Log.i(LOG_TAG, "Acquired WiFi MulticastLock for mDNS discovery")
        } catch (e: Exception) {
            Log.w(LOG_TAG, "Failed to acquire MulticastLock: ${e.message}")
        }
    }

    private fun releaseMulticastLock() {
        try {
            if (multicastLock?.isHeld == true) {
                multicastLock?.release()
                Log.i(LOG_TAG, "Released WiFi MulticastLock")
            }
        } catch (_: Exception) {}
        multicastLock = null
    }

    private fun loadCachedPeers() {
        try {
            val raw = sp.getString(CACHED_PEERS_PREF_KEY, null) ?: return
            val json = JSONObject(raw)
            val keys = json.keys()
            var loadedCount = 0
            while (keys.hasNext()) {
                val did = keys.next()
                val peerObj = json.optJSONObject(did) ?: continue
                val host = peerObj.optString("host")
                val port = peerObj.optInt("port", 0)
                val os = peerObj.optString("os").takeIf { it.isNotBlank() }
                if (did.isNotBlank() && did != deviceId && host.isNotBlank() && port in 1..65535) {
                    peers[did] = PeerAddress(host, port, os)
                    LanPeerReporter.getInstance().addPeer(did, host, port, os)
                    loadedCount++
                }
            }
            if (loadedCount > 0) {
                Log.i(LOG_TAG, "Loaded $loadedCount cached LAN peer(s) from storage")
            }
        } catch (e: Exception) {
            Log.w(LOG_TAG, "Failed to load cached LAN peers: ${e.message}")
        }
    }

    private fun saveCachedPeers() {
        try {
            val json = JSONObject()
            peers.forEach { (did, address) ->
                val obj = JSONObject().apply {
                    put("host", address.host)
                    put("port", address.port)
                    if (address.os != null) put("os", address.os)
                }
                json.put(did, obj)
            }
            sp.edit().putString(CACHED_PEERS_PREF_KEY, json.toString()).apply()
        } catch (e: Exception) {
            Log.w(LOG_TAG, "Failed to save cached LAN peers: ${e.message}")
        }
    }

    private fun recordPeer(did: String, host: String, port: Int, source: String, os: String? = null) {
        if (did.isBlank() || did == deviceId || host.isBlank() || port !in 1..65535) return
        val existing = peers[did]
        val resolvedOs = os?.takeIf { it.isNotBlank() } ?: existing?.os
        if (existing == null || existing.host != host || existing.port != port || existing.os != resolvedOs) {
            peers[did] = PeerAddress(host, port, resolvedOs)
            LanPeerReporter.getInstance().addPeer(did, host, port, resolvedOs)
            saveCachedPeers()
            scheduleDiscoveryRefresh()
            Log.i(LOG_TAG, "Peer recorded ($source): $did @ $host:$port os=$resolvedOs")
        }
    }

    private fun showErrorToast(message: String) {
        val now = SystemClock.elapsedRealtime()
        synchronized(this) {
            if (message == lastErrorToastMessage && now - lastErrorToastAtMs < errorToastCooldownMs) {
                return
            }
            lastErrorToastMessage = message
            lastErrorToastAtMs = now
        }
        mainHandler.post {
            runCatching {
                Toast.makeText(appContext, message, Toast.LENGTH_SHORT).show()
            }
        }
    }

    private val discoveryRefreshRunnable = object : Runnable {
        override fun run() {
            if (!started || nsdPaused) return
            refreshDiscovery("periodic")
            scheduleDiscoveryRefresh()
        }
    }

    // MARK: - Screen State
    private var isScreenOn: Boolean = true
    private var screenReceiverRegistered: Boolean = false
    private var nsdPaused: Boolean = false

    private val screenStateReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            when (intent?.action) {
                Intent.ACTION_SCREEN_OFF -> {
                    isScreenOn = false
                    if (started) pauseNsd()
                }
                Intent.ACTION_SCREEN_ON -> {
                    isScreenOn = true
                    if (started) resumeNsd()
                }
            }
        }
    }

    private val httpClient = OkHttpClient.Builder()
        .connectTimeout(3, TimeUnit.SECONDS)
        .readTimeout(5, TimeUnit.SECONDS)
        .writeTimeout(5, TimeUnit.SECONDS)
        .build()

    // MARK: - Lifecycle

    fun start() {
        if (started || !lanSyncEnabled) return
        started = true
        loadCachedPeers()
        isScreenOn = readScreenInteractiveState()
        registerScreenReceiver()
        startServer()
        if (isScreenOn) {
            acquireMulticastLock()
            registerNsd()
            discoverPeers()
            scheduleDiscoveryRefresh()
        } else {
            nsdPaused = true
            Log.i(LOG_TAG, "LAN sync started with mDNS deferred (screen off)")
        }
        Log.i(LOG_TAG, "LAN sync started on port $serverPort")
    }

    fun stop() {
        if (!started) return
        started = false
        mainHandler.removeCallbacks(discoveryRefreshRunnable)
        releaseMulticastLock()
        unregisterScreenReceiver()
        stopDiscovery()
        unregisterNsd()
        serverThread?.interrupt()
        serverSocket?.close()
        connectionExecutor?.shutdownNow()
        connectionExecutor = null
        serverSocket = null
        peers.clear()
        serviceNameToDeviceId.clear()
        nsdPaused = false
        LanPeerReporter.getInstance().clear()
        Log.i(LOG_TAG, "LAN sync stopped")
    }

    private fun readScreenInteractiveState(): Boolean {
        val pm = appContext.getSystemService(Context.POWER_SERVICE) as? PowerManager
        return pm?.isInteractive ?: true
    }

    private fun registerScreenReceiver() {
        if (screenReceiverRegistered) return
        val filter = IntentFilter().apply {
            addAction(Intent.ACTION_SCREEN_ON)
            addAction(Intent.ACTION_SCREEN_OFF)
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            appContext.registerReceiver(screenStateReceiver, filter, Context.RECEIVER_NOT_EXPORTED)
        } else {
            @Suppress("UnspecifiedRegisterReceiverFlag")
            appContext.registerReceiver(screenStateReceiver, filter)
        }
        screenReceiverRegistered = true
    }

    private fun unregisterScreenReceiver() {
        if (!screenReceiverRegistered) return
        try { appContext.unregisterReceiver(screenStateReceiver) } catch (_: Exception) {}
        screenReceiverRegistered = false
    }

    fun reconfigure() {
        if (lanSyncEnabled && !started) {
            start()
        } else if (!lanSyncEnabled && started) {
            stop()
        }
    }

    // MARK: - HTTP Server

    private fun startServer() {
        val ss = ServerSocket(0) // OS assigns an ephemeral port
        serverSocket = ss
        serverPort = ss.localPort
        connectionExecutor = ThreadPoolExecutor(
            2,
            4,
            30L,
            TimeUnit.SECONDS,
            ArrayBlockingQueue(8),
            Executors.defaultThreadFactory(),
            RejectedExecutionHandler { runnable, _ ->
                val task = runnable as? ConnectionTask
                if (task != null) {
                    try {
                        task.socket.close()
                    } catch (_: Exception) {
                    }
                    Log.w(LOG_TAG, "LAN receive queue full; rejecting connection")
                }
            },
        ).apply {
            allowCoreThreadTimeOut(true)
        }

        serverThread = Thread({
            Log.d(LOG_TAG, "Server listening on port $serverPort")
            while (!Thread.currentThread().isInterrupted) {
                val clientSocket: Socket = try {
                    ss.accept()
                } catch (_: IOException) {
                    break // socket closed → stop
                }
                try {
                    connectionExecutor?.execute(ConnectionTask(clientSocket))
                } catch (_: RejectedExecutionException) {
                    try {
                        clientSocket.close()
                    } catch (_: Exception) {
                    }
                }
            }
            Log.d(LOG_TAG, "Server thread exiting")
        }, "lan-server").also {
            it.isDaemon = true
            it.start()
        }
    }

    private inner class ConnectionTask(val socket: Socket) : Runnable {
        override fun run() {
            handleConnection(socket)
        }
    }

    private fun handleConnection(socket: Socket) {
        try {
            socket.use { s ->
                s.soTimeout = 5_000
                val rawInput = s.getInputStream()
                // Minimal HTTP/1.1 request parsing
                val requestLine = readAsciiLine(rawInput) ?: return
                // Respond to health-check pings from desktop peers.
                if (requestLine.startsWith("GET /ping")) {
                    val headers = mutableMapOf<String, String>()
                    while (true) {
                        val line = readAsciiLine(rawInput) ?: break
                        if (line.isEmpty()) break
                        val colon = line.indexOf(':')
                        if (colon > 0) {
                            headers[line.substring(0, colon).trim().lowercase()] =
                                line.substring(colon + 1).trim()
                        }
                    }
                    learnPeerFromPing(headers, s.inetAddress)
                    s.getOutputStream().write("HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n".toByteArray())
                    return
                }
                if (!requestLine.startsWith("POST /clip")) return

                val headers = mutableMapOf<String, String>()
                while (true) {
                    val line = readAsciiLine(rawInput) ?: break
                    if (line.isEmpty()) break
                    val colon = line.indexOf(':')
                    if (colon > 0) {
                        headers[line.substring(0, colon).trim().lowercase()] =
                            line.substring(colon + 1).trim()
                    }
                }

                val fromDeviceId = headers["x-cc-did"] ?: return
                if (fromDeviceId == deviceId) return // don't receive own broadcasts

                // Opportunistically learn or refresh peer address from incoming clip traffic
                val remotePort = headers["x-cc-port"]?.toIntOrNull()?.takeIf { it in 1..65535 }
                val remoteHost = s.inetAddress?.hostAddress
                val remoteOs = headers["x-cc-os"]
                if (remotePort != null && !remoteHost.isNullOrBlank()) {
                    recordPeer(fromDeviceId, remoteHost, remotePort, "clip-traffic", remoteOs)
                }

                val originId = headers["x-cc-oid"] ?: return
                val typeStr = headers["x-cc-type"] ?: return
                val hmacHeader = headers["x-cc-hmac"] ?: return
                val contentLength = headers["content-length"]?.toIntOrNull() ?: return
                if (contentLength !in 1..MAX_BODY_BYTES) {
                    Log.w(LOG_TAG, "Rejecting clip with invalid body size: $contentLength")
                    return
                }

                // Dart peers send "media" or "file" (ClipItemType names); map
                // these to ClipType.FileUrl which triggers the binary handler.
                val clipType: ClipType? = when (typeStr.lowercase()) {
                    "media", "file" -> ClipType.FileUrl
                    else -> ClipType.entries.firstOrNull {
                        it.name.lowercase() == typeStr.lowercase()
                    }
                }
                if (clipType == null) {
                    Log.w(LOG_TAG, "Unknown clip type: $typeStr")
                    return
                }

                when (clipType) {
                    ClipType.Text, ClipType.Url, ClipType.Email, ClipType.Phone -> {
                        if (contentLength > MAX_TEXT_BODY_BYTES) {
                            Log.w(LOG_TAG, "Rejecting oversized text clip: $contentLength bytes")
                            return
                        }
                        val bodyBytes = readBodyBytes(rawInput, contentLength, originId) ?: return
                        if (!verifyHmac(bodyBytes, hmacHeader)) {
                            Log.w(LOG_TAG, "HMAC verification failed from $fromDeviceId")
                            showErrorToast("LAN clip authentication failed")
                            return
                        }
                        handleTextClip(bodyBytes, fromDeviceId, originId, clipType)
                    }
                    ClipType.FileUrl -> {
                        val headerExt = headers["x-cc-ext"]?.trim()?.lowercase()
                        val headerMime = headers["x-cc-mime"] ?: headers["content-type"]
                        val mime = sanitizeMimeType(headerMime, headerExt)
                        val ext = sanitizeExt(headerExt, mime)
                        val resolvedType = if (mime.startsWith("image/") || mime.startsWith("video/")) ClipType.FileUrl else clipType
                        handleBinaryClip(
                            rawInput,
                            contentLength,
                            hmacHeader,
                            fromDeviceId,
                            originId,
                            resolvedType,
                            mime,
                            ext,
                            sanitizeFileName(headers["x-cc-name"], originId),
                            headers["x-cc-source-id"],
                            headers["x-cc-source-app"],
                        )
                    }
                }

                // Send minimal HTTP 200 response
                s.getOutputStream().write("HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n".toByteArray())
            }
        } catch (e: Exception) {
            Log.e(LOG_TAG, "Error handling connection: ${e.message}")
        }
    }

    private fun readBodyBytes(
        input: java.io.InputStream,
        contentLength: Int,
        originId: String,
    ): ByteArray? {
        val bodyBytes = ByteArray(contentLength)
        var offset = 0
        while (offset < contentLength) {
            val read = input.read(bodyBytes, offset, contentLength - offset)
            if (read == -1) break
            offset += read
        }

        if (offset != contentLength) {
            Log.w(LOG_TAG, "Short body for $originId: expected=$contentLength got=$offset")
            return null
        }

        return bodyBytes
    }

    private fun readAsciiLine(input: java.io.InputStream): String? {
        val sb = StringBuilder()
        while (true) {
            val b = input.read()
            if (b == -1) {
                return if (sb.isEmpty()) null else sb.toString()
            }
            if (sb.length >= MAX_HEADER_LINE_BYTES) {
                Log.w(LOG_TAG, "Rejecting oversized HTTP header line")
                return null
            }
            if (b == '\n'.code) break
            if (b != '\r'.code) sb.append(b.toChar())
        }
        return sb.toString()
    }

    private fun learnPeerFromPing(headers: Map<String, String>, remoteAddress: InetAddress) {
        val announcedDeviceId = headers["x-cc-did"]?.takeIf { it.isNotBlank() } ?: return
        val announcedPort = headers["x-cc-port"]?.toIntOrNull()?.takeIf { it in 1..65535 } ?: return
        val host = remoteAddress.hostAddress ?: return
        val announcedOs = headers["x-cc-os"]
        recordPeer(announcedDeviceId, host, announcedPort, "ping", announcedOs)
    }

    private fun handleTextClip(
        body: ByteArray,
        fromDeviceId: String,
        originId: String,
        type: ClipType,
    ) {
        val bodyStr = try {
            String(body, Charsets.UTF_8)
        } catch (e: Exception) {
            Log.w(LOG_TAG, "Malformed UTF-8 text clip: ${e.message}")
            return
        }

        val envelope = try {
            LanClipEnvelope.json.decodeFromString<LanClipEnvelope>(bodyStr)
        } catch (e: Exception) {
            Log.w(LOG_TAG, "Malformed JSON text clip: ${e.message}")
            return
        }

        val timestamp = if (envelope.ts > 0L) envelope.ts else System.currentTimeMillis()
        if (System.currentTimeMillis() - timestamp > REPLAY_WINDOW_MS) {
            Log.w(LOG_TAG, "Replay detected, dropping clip from $fromDeviceId")
            return
        }

        val payload = envelope.toLanClipPayload(
            fromDeviceId = fromDeviceId,
            fallbackOriginId = originId,
            defaultType = type,
        )

        onLanClipReceived(payload)

        if (autoWriteOnReceive && !payload.deleted && !payload.locked && payload.content.isNotBlank()) {
            val textToWrite = if (payload.encrypted) {
                decryptContent?.invoke(payload.content, payload.encMode, payload.iv)
            } else {
                payload.content
            }
            if (textToWrite != null) {
                onBeforeClipboardWrite(textToWrite.toByteArray())
                writeTextToClipboard(textToWrite, payload.label)
            } else if (payload.encrypted) {
                Log.w(LOG_TAG, "Skipping clipboard write: encrypted LAN clip could not be decrypted")
            }
        }
    }

    private fun handleBinaryClip(
        input: java.io.InputStream,
        contentLength: Int,
        expectedHmac: String,
        fromDeviceId: String,
        originId: String,
        type: ClipType,
        mimeType: String,
        ext: String,
        fileName: String,
        sourceId: String?,
        sourceApp: String?,
    ) {
        var tempFile: File? = null
        try {
            val recvDir = File(appContext.cacheDir, LAN_RECV_DIR).also { it.mkdirs() }
            val safeOriginId = originId.replace(Regex("[^a-zA-Z0-9\\-]"), "_")
            tempFile = File(recvDir, "$safeOriginId.$ext")
            val mac = Mac.getInstance(HMAC_ALGO).apply {
                init(SecretKeySpec(userId.toByteArray(Charsets.UTF_8), HMAC_ALGO))
            }
            val buffer = ByteArray(STREAM_BUFFER_BYTES)
            var remaining = contentLength

            FileOutputStream(tempFile).use { output ->
                while (remaining > 0) {
                    val bytesToRead = minOf(buffer.size, remaining)
                    val read = input.read(buffer, 0, bytesToRead)
                    if (read == -1) {
                        Log.w(LOG_TAG, "Short streamed body for $originId: expected=$contentLength got=${contentLength - remaining}")
                        tempFile.delete()
                        return
                    }
                    output.write(buffer, 0, read)
                    mac.update(buffer, 0, read)
                    remaining -= read
                }
                output.flush()
            }

            val expectedBytes = parseHmacHex(expectedHmac)
            if (expectedBytes == null || !MessageDigest.isEqual(mac.doFinal(), expectedBytes)) {
                Log.w(LOG_TAG, "HMAC verification failed from $fromDeviceId")
                showErrorToast("LAN clip authentication failed")
                tempFile.delete()
                return
            }

            val fileSize = tempFile.length()
            val payload = LanClipPayload(
                originId = originId,
                fromDeviceId = fromDeviceId,
                type = type,
                content = "",
                label = fileName,
                timestamp = System.currentTimeMillis(),
                encrypted = false,
                iv = null,
                encMode = null,
                localFilePath = tempFile.absolutePath,
                fileMimeType = mimeType,
                fileExtension = ext,
                fileName = fileName,
                fileSize = fileSize,
                sourceId = sourceId,
                sourceApp = sourceApp,
                title = fileName,
                description = null,
            )
            onLanClipReceived(payload)

            // Optionally also place the file on the OS clipboard.
            if (autoWriteOnReceive) {
                if (contentLength > maxAutoCopyBytes) {
                    Log.i(LOG_TAG, "Binary clip exceeds auto-copy limit ($maxAutoCopyBytes bytes), skipping clipboard write")
                    return
                }
                val uri = FileProvider.getUriForFile(
                    appContext,
                    "${appContext.packageName.lowercase()}.fileprovider",
                    tempFile,
                )
                val clipData = AndroidClipData.newUri(appContext.contentResolver, fileName, uri)
                val cm = appContext.getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
                onBeforeClipboardWrite(tempFile.readBytes())
                cm.setPrimaryClip(clipData)
            }
            Log.d(LOG_TAG, "Binary clip ($mimeType) received from $fromDeviceId — persisted${if (autoWriteOnReceive) " + clipboard" else ""}")
        } catch (e: Exception) {
            Log.e(LOG_TAG, "Failed to handle binary clip: ${e.message}")
            tempFile?.delete()
        }
    }

    private fun writeTextToClipboard(text: String, label: String) {
        try {
            val cm = appContext.getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
            val clip = AndroidClipData.newPlainText(label.ifBlank { "CopyCat" }, text)
            cm.setPrimaryClip(clip)
        } catch (e: Exception) {
            Log.e(LOG_TAG, "Failed to write text to clipboard: ${e.message}")
        }
    }

    private fun sanitizeMimeType(raw: String?, ext: String? = null): String {
        val value = raw?.split(";")?.firstOrNull()?.trim().orEmpty()
        if (value.isNotEmpty() && !value.equals("null", ignoreCase = true) && value != "*/*" && value != "application/octet-stream") {
            return value
        }
        val cleanExt = ext?.trim()?.lowercase().orEmpty().replace(Regex("[^a-z0-9]"), "")
        if (cleanExt.isNotEmpty()) {
            val fromExt = MimeTypeMap.getSingleton().getMimeTypeFromExtension(cleanExt)
            if (!fromExt.isNullOrBlank()) return fromExt
            return when (cleanExt) {
                "png" -> "image/png"
                "jpg", "jpeg" -> "image/jpeg"
                "webp" -> "image/webp"
                "gif" -> "image/gif"
                "svg" -> "image/svg+xml"
                "mp4" -> "video/mp4"
                "pdf" -> "application/pdf"
                else -> "application/octet-stream"
            }
        }
        return "application/octet-stream"
    }

    private fun sanitizeExt(raw: String?, mimeType: String? = null): String {
        val value = raw?.trim()?.lowercase().orEmpty()
            .replace(Regex("[^a-z0-9]"), "")
        if (value.isNotEmpty() && value != "bin") return value
        val mime = mimeType?.lowercase().orEmpty()
        return when {
            mime.contains("png") -> "png"
            mime.contains("jpeg") || mime.contains("jpg") -> "jpg"
            mime.contains("webp") -> "webp"
            mime.contains("gif") -> "gif"
            else -> if (value.isNotEmpty()) value else "bin"
        }
    }

    private fun sanitizeFileName(raw: String?, originId: String): String {
        val value = raw?.trim().orEmpty()
        if (value.isEmpty() || value.equals("null", ignoreCase = true)) return originId
        return value
    }

    // MARK: - NSD Registration

    private fun registerNsd() {
        val nsd = appContext.getSystemService(Context.NSD_SERVICE) as NsdManager
        nsdManager = nsd

        val info = NsdServiceInfo().apply {
            serviceName = "copycat-$deviceId"
            serviceType = this@CopyCatLanSyncManager.serviceType
            port = serverPort
            setAttribute("did", deviceId)
            setAttribute("os", "android")
        }

        val listener = object : NsdManager.RegistrationListener {
            override fun onServiceRegistered(info: NsdServiceInfo) {
                Log.d(LOG_TAG, "NSD registered: ${info.serviceName} port=$serverPort")
                // Re-start discovery shortly after registration to recover from
                // stale NSD sessions where peers are not surfaced until a full
                // off/on toggle.
                mainHandler.postDelayed({
                    if (started) refreshDiscovery("post-register")
                }, DISCOVERY_POST_REGISTER_DELAY_MS)
            }
            override fun onRegistrationFailed(info: NsdServiceInfo, errorCode: Int) {
                Log.w(LOG_TAG, "NSD registration failed: $errorCode")
            }
            override fun onServiceUnregistered(info: NsdServiceInfo) {
                Log.d(LOG_TAG, "NSD unregistered")
            }
            override fun onUnregistrationFailed(info: NsdServiceInfo, errorCode: Int) {
                Log.w(LOG_TAG, "NSD unregistration failed: $errorCode")
            }
        }
        registrationListener = listener
        nsd.registerService(info, NsdManager.PROTOCOL_DNS_SD, listener)
    }

    private fun unregisterNsd() {
        try {
            registrationListener?.let { nsdManager?.unregisterService(it) }
        } catch (_: Exception) {}
        registrationListener = null
    }

    // MARK: - NSD Discovery

    private fun discoverPeers() {
        val nsd = nsdManager ?: return
        val listener = object : NsdManager.DiscoveryListener {
            override fun onDiscoveryStarted(serviceType: String) {
                Log.d(LOG_TAG, "NSD discovery started")
            }
            override fun onDiscoveryStopped(serviceType: String) {
                Log.d(LOG_TAG, "NSD discovery stopped")
            }
            override fun onStartDiscoveryFailed(serviceType: String, errorCode: Int) {
                Log.w(LOG_TAG, "NSD discovery start failed: $errorCode")
                if (started) {
                    mainHandler.postDelayed(
                        { if (started) refreshDiscovery("start-failed:$errorCode") },
                        DISCOVERY_POST_REGISTER_DELAY_MS,
                    )
                }
            }
            override fun onStopDiscoveryFailed(serviceType: String, errorCode: Int) {
                Log.w(LOG_TAG, "NSD discovery stop failed: $errorCode")
                if (started) {
                    mainHandler.postDelayed(
                        { if (started) refreshDiscovery("stop-failed:$errorCode") },
                        DISCOVERY_POST_REGISTER_DELAY_MS,
                    )
                }
            }
            override fun onServiceFound(info: NsdServiceInfo) {
                if (!matchesServiceType(info.serviceType)) {
                    Log.d(LOG_TAG, "Ignoring service ${info.serviceName} of type ${info.serviceType}")
                    return
                }
                // Resolve to get host + port
                nsd.resolveService(info, makeResolveListener())
            }
            override fun onServiceLost(info: NsdServiceInfo) {
                // Look up the deviceId from the service-name map recorded at
                // resolution time; fall back to name parsing for resilience.
                val did = serviceNameToDeviceId.remove(info.serviceName)
                    ?: peerKeyFromServiceName(info.serviceName)
                // Only evict the peer once ALL mDNS service names for this
                // device are gone. When mDNS conflict-renames a re-registered
                // service, two names temporarily map to the same deviceId;
                // losing the stale one must not evict the live peer.
                if (serviceNameToDeviceId.values.none { it == did }) {
                    if (peers.remove(did) != null) {
                        LanPeerReporter.getInstance().removePeer(did)
                        Log.d(LOG_TAG, "Peer lost: $did")
                        scheduleDiscoveryRefresh()
                    }
                }
            }
        }
        discoveryListener = listener
        nsd.discoverServices(serviceType, NsdManager.PROTOCOL_DNS_SD, listener)
    }

    private fun scheduleDiscoveryRefresh() {
        mainHandler.removeCallbacks(discoveryRefreshRunnable)
        val delayMs = if (peers.isEmpty()) {
            DISCOVERY_REFRESH_EMPTY_MS
        } else {
            DISCOVERY_REFRESH_STABLE_MS
        }
        mainHandler.postDelayed(discoveryRefreshRunnable, delayMs)
    }

    private fun pauseNsd() {
        if (nsdPaused) return
        nsdPaused = true
        mainHandler.removeCallbacks(discoveryRefreshRunnable)
        releaseMulticastLock()
        stopDiscovery()
        unregisterNsd()
        Log.i(LOG_TAG, "LAN mDNS paused (screen off, ${peers.size} peers cached)")
    }

    private fun resumeNsd() {
        if (!nsdPaused) return
        nsdPaused = false
        acquireMulticastLock()
        registerNsd()
        discoverPeers()
        scheduleDiscoveryRefresh()
        Log.i(LOG_TAG, "LAN mDNS resumed (screen on)")
    }

    private fun refreshDiscovery(reason: String) {
        if (!started || nsdPaused) return
        stopDiscovery()
        discoverPeers()
        Log.d(LOG_TAG, "NSD discovery refreshed ($reason)")
    }

    private fun stopDiscovery() {
        try {
            discoveryListener?.let { nsdManager?.stopServiceDiscovery(it) }
        } catch (_: Exception) {}
        discoveryListener = null
    }

    private fun makeResolveListener(): NsdManager.ResolveListener =
        object : NsdManager.ResolveListener {
            override fun onResolveFailed(info: NsdServiceInfo, errorCode: Int) {
                Log.w(LOG_TAG, "NSD resolve failed: $errorCode for ${info.serviceName}")
            }
            override fun onServiceResolved(info: NsdServiceInfo) {
                // Prefer the 'did' TXT attribute; fall back to service-name
                // parsing. Reading the attribute is resilient to mDNS conflict-
                // renaming (e.g. "copycat-UUID (2)") that bonsoir may apply on
                // the remote peer when it re-registers after a restart.
                val didBytes = info.attributes["did"]
                val did = if (didBytes != null && didBytes.isNotEmpty()) {
                    String(didBytes, Charsets.UTF_8)
                } else {
                    peerKeyFromServiceName(info.serviceName)
                }
                if (did == deviceId) return // self
                val host = info.host?.hostAddress ?: return
                val osBytes = info.attributes["os"]
                val osStr = if (osBytes != null && osBytes.isNotEmpty()) {
                    String(osBytes, Charsets.UTF_8)
                } else null
                serviceNameToDeviceId[info.serviceName] = did
                recordPeer(did, host, info.port, "mdns-resolve", osStr)
                // Announce our own HTTP server address to the peer immediately
                // so it can broadcast clips back to us without waiting for its
                // own mDNS discovery cycle.
                announceSelfToPeer(PeerAddress(host, info.port, osStr))
            }
        }

    private fun peerKeyFromServiceName(name: String): String =
        name.removePrefix("copycat-")

    /**
     * NSD reports the service type inconsistently across OEMs, with or without
     * a trailing dot, and sometimes truncated to just "_tcp.", so compare on a
     * normalized form instead of requiring an exact match.
     */
    private fun matchesServiceType(found: String?): Boolean {
        val normalizedFound = found?.trim()?.trim('.')?.lowercase().orEmpty()
        if (normalizedFound.isEmpty()) return true
        val expected = serviceType.trim('.').lowercase()
        return normalizedFound == expected ||
            expected.endsWith(normalizedFound) ||
            normalizedFound.endsWith(expected)
    }

    // MARK: - Sending

    /**
     * Sends a GET /ping to [peer] with our device ID and HTTP server port so
     * the remote peer can register us for reverse-discovery without waiting for
     * its own mDNS query cycle. Runs on a short-lived daemon thread.
     */
    private fun announceSelfToPeer(peer: PeerAddress) {
        Thread({
            try {
                val request = Request.Builder()
                    .url("http://${peer.host}:${peer.port}/ping")
                    .addHeader("X-CC-DID", deviceId)
                    .addHeader("X-CC-PORT", serverPort.toString())
                    .addHeader("X-CC-OS", "android")
                    .get()
                    .build()
                httpClient.newCall(request).execute().use { /* trigger reverse learning */ }
                Log.d(LOG_TAG, "Announced self to ${peer.host}:${peer.port}")
            } catch (e: Exception) {
                Log.d(LOG_TAG, "Self-announcement failed: ${e.message}")
            }
        }, "lan-hello").also { it.isDaemon = true; it.start() }
    }


    /**
     * Broadcast a clip to all LAN peers:
     * 1. Broadcast the clip JSON payload.
     * 2. If it is media/file and NOT deleted, attach the binary file.
     */
    fun broadcastClip(data: Map<String, Any?>) {
        val item = try {
            LanClipEnvelope.json.decodeFromString<LanClipItem>(JSONObject(data).toString())
        } catch (e: Exception) {
            Log.w(LOG_TAG, "Failed to decode LanClipItem from map: ${e.message}")
            return
        }
        val localPath = (data["localPath"] as? String) ?: item.localPath
        broadcastClip(item, localPath)
    }

    fun broadcastClip(item: LanClipItem, localPath: String? = null) {
        if (!started || peers.isEmpty() || userId.isBlank()) return
        val originId = item.originId?.takeIf { it.isNotBlank() } ?: return

        val isDeleted = item.deletedAt != null && item.deletedAt.isNotBlank() && !item.deletedAt.equals("null", ignoreCase = true)
        val path = localPath ?: item.localPath
        val typeLower = (item.type ?: "text").lowercase()
        val isBinary = !isDeleted &&
            (typeLower == "media" || typeLower == "file" || typeLower == "fileurl") &&
            !path.isNullOrBlank()

        if (isBinary) {
            val file = File(path!!)
            if (file.exists() && file.canRead()) {
                val fileExt = file.extension.lowercase()
                val cleanExt = item.fileExtension?.takeIf { it.isNotBlank() && it != "bin" }
                    ?: fileExt.ifBlank { "bin" }
                val mimeType = item.fileMimeType?.takeIf { it.isNotBlank() && it != "*/*" && it != "application/octet-stream" }
                    ?: MimeTypeMap.getSingleton().getMimeTypeFromExtension(cleanExt)
                    ?: when (cleanExt) {
                        "jpg", "jpeg" -> "image/jpeg"
                        "png" -> "image/png"
                        "webp" -> "image/webp"
                        "gif" -> "image/gif"
                        "svg" -> "image/svg+xml"
                        "mp4" -> "video/mp4"
                        "pdf" -> "application/pdf"
                        else -> "application/octet-stream"
                    }
                val resolvedType = if (mimeType.startsWith("image/") || mimeType.startsWith("video/")) "media" else "file"
                val resolvedExt = if (cleanExt == "bin" && mimeType.startsWith("image/")) {
                    mimeType.substringAfterLast('/').substringBefore(';').let { if (it == "jpeg") "jpg" else it }
                } else cleanExt
                val fileName = item.fileName?.takeIf { it.isNotBlank() } ?: file.name

                sendBinaryClip(
                    originId = originId,
                    data = file.readBytes(),
                    mimeType = mimeType,
                    ext = resolvedExt,
                    fileName = fileName,
                    sourceId = item.sourceId,
                    sourceApp = item.sourceApp,
                    createdIso = item.created,
                    modifiedIso = item.modified,
                    typeStr = resolvedType,
                )
                return
            }
        }

        // For non-binary clips (text, url, deletions, or metadata mutations): broadcast the JSON envelope.
        val envelope = LanClipEnvelope.fromItem(
            item = item,
            deviceId = deviceId,
            os = "android",
            localPath = localPath,
        )

        val jsonString = LanClipEnvelope.json.encodeToString(envelope)
        val bodyBytes = jsonString.toByteArray(Charsets.UTF_8)
        val hmac = computeHmac(bodyBytes)

        peers.values.forEach { peer ->
            sendToPeer(
                peer = peer,
                originId = originId,
                typeStr = if (isDeleted) "text" else if (typeLower == "url") "url" else "text",
                body = bodyBytes,
                hmac = hmac,
                contentType = "application/json",
                ext = null,
                fileName = null,
                sourceId = envelope.sourceId,
                sourceApp = envelope.sourceApp,
                createdIso = envelope.created,
                modifiedIso = envelope.modified,
            )
        }
    }

    private fun sendBinaryClip(
        originId: String,
        data: ByteArray,
        mimeType: String,
        ext: String,
        fileName: String,
        sourceId: String? = null,
        sourceApp: String? = null,
        createdIso: String? = null,
        modifiedIso: String? = null,
        typeStr: String = "file",
    ) {
        val hmac = computeHmac(data)
        val desktopPeers = peers.values.filter { it.isDesktop }
        val delegatePeer = if (desktopPeers.isNotEmpty()) desktopPeers.random() else null

        peers.values.forEach { peer ->
            sendToPeer(
                peer = peer,
                originId = originId,
                typeStr = typeStr,
                body = data,
                hmac = hmac,
                contentType = mimeType,
                ext = ext,
                fileName = fileName,
                sourceId = sourceId,
                sourceApp = sourceApp,
                createdIso = createdIso,
                modifiedIso = modifiedIso,
                delegateUpload = (peer == delegatePeer),
            )
        }
    }

    private fun sendToPeer(
        peer: PeerAddress,
        originId: String,
        typeStr: String,
        body: ByteArray,
        hmac: String,
        contentType: String,
        ext: String?,
        fileName: String?,
        sourceId: String?,
        sourceApp: String?,
        createdIso: String? = null,
        modifiedIso: String? = null,
        delegateUpload: Boolean = false,
    ) {
        try {
            val requestBuilder = Request.Builder()
                .url("http://${peer.host}:${peer.port}/clip")
                .addHeader("X-CC-DID", deviceId)
                .addHeader("X-CC-OID", originId)
                .addHeader("X-CC-TYPE", typeStr)
                .addHeader("X-CC-HMAC", hmac)
                .addHeader("X-CC-PORT", serverPort.toString())
                .addHeader("X-CC-TS", System.currentTimeMillis().toString())
                .addHeader("X-CC-SIZE", body.size.toString())
                .addHeader("X-CC-OS", "android")
            if (delegateUpload) {
                requestBuilder.addHeader("X-CC-DELEGATE-UPLOAD", "1")
            }
            if (ext != null) requestBuilder.addHeader("X-CC-EXT", ext)
            if (fileName != null) requestBuilder.addHeader("X-CC-NAME", fileName)
            if (contentType.isNotBlank()) {
                requestBuilder.addHeader("X-CC-MIME", contentType)
                requestBuilder.addHeader("Content-Type", contentType)
            }
            if (!createdIso.isNullOrBlank()) requestBuilder.addHeader("X-CC-CREATED", createdIso)
            if (!modifiedIso.isNullOrBlank()) requestBuilder.addHeader("X-CC-MODIFIED", modifiedIso)
            if (!sourceId.isNullOrBlank()) {
                requestBuilder.addHeader("X-CC-SOURCE-ID", sourceId)
            }
            if (!sourceApp.isNullOrBlank()) {
                requestBuilder.addHeader("X-CC-SOURCE-APP", sourceApp)
            }

            val request = requestBuilder
                .post(body.toRequestBody(contentType.toMediaTypeOrNull()))
                .build()

            enqueueWithRetry(peer, request)
        } catch (e: Exception) {
            Log.d(LOG_TAG, "Could not build send request to peer ${peer.host}:${peer.port}: ${e.message}")
        }
    }

    private fun enqueueWithRetry(
        peer: PeerAddress,
        request: Request,
        attempt: Int = 1,
    ) {
        httpClient.newCall(request).enqueue(object : Callback {
            override fun onFailure(call: Call, e: IOException) {
                if (attempt <= MAX_SEND_RETRIES) {
                    val delayMs = if (attempt == 1) 350L else 1000L
                    Log.d(LOG_TAG, "Delivery to ${peer.host}:${peer.port} failed ($attempt/$MAX_SEND_RETRIES), retrying in ${delayMs}ms: ${e.message}")
                    mainHandler.postDelayed({
                        enqueueWithRetry(peer, request, attempt + 1)
                    }, delayMs)
                } else {
                    Log.d(LOG_TAG, "Could not reach peer ${peer.host}:${peer.port} after $MAX_SEND_RETRIES retries: ${e.message}")
                }
            }

            override fun onResponse(call: Call, response: Response) {
                response.use { res ->
                    if (!res.isSuccessful) {
                        Log.w(LOG_TAG, "Peer ${peer.host}:${peer.port} returned ${res.code}")
                    }
                }
            }
        })
    }

    private fun toIso8601Utc(timestampMs: Long): String {
        val formatter = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US)
        formatter.timeZone = TimeZone.getTimeZone("UTC")
        return formatter.format(Date(timestampMs))
    }

    // MARK: - Auth

    private fun computeHmac(body: ByteArray): String {
        val key = userId.toByteArray(Charsets.UTF_8)
        val mac = Mac.getInstance(HMAC_ALGO)
        mac.init(SecretKeySpec(key, HMAC_ALGO))
        val digest = mac.doFinal(body)
        return digest.joinToString("") { "%02x".format(it) }
    }

    private fun verifyHmac(body: ByteArray, expected: String): Boolean {
        if (userId.isBlank()) return false
        val expectedBytes = parseHmacHex(expected) ?: return false
        val key = userId.toByteArray(Charsets.UTF_8)
        val mac = Mac.getInstance(HMAC_ALGO)
        mac.init(SecretKeySpec(key, HMAC_ALGO))
        return MessageDigest.isEqual(mac.doFinal(body), expectedBytes)
    }

    private fun parseHmacHex(hex: String): ByteArray? {
        if (hex.length != 64) return null
        return try {
            ByteArray(32) { i -> hex.substring(i * 2, i * 2 + 2).toInt(16).toByte() }
        } catch (_: NumberFormatException) {
            null
        }
    }
}
