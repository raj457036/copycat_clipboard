import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class FileLogSink {
  FileLogSink._();

  static final FileLogSink instance = FileLogSink._();

  static const _maxFileSize = 5 * 1024 * 1024; // 5 MB
  static const _truncateTarget = 3 * 1024 * 1024; // keep last 3 MB
  static const _flushInterval = Duration(seconds: 5);

  File? _logFile;
  IOSink? _sink;
  // ignore: unused_field
  Timer? _flushTimer;
  bool _initialized = false;
  final _queue = Queue<String>();
  bool _flushing = false;

  bool get isInitialized => _initialized;

  Future<void> init() async {
    if (_initialized) return;
    try {
      final dir = await getApplicationSupportDirectory();
      final logsDir = Directory(p.join(dir.path, 'logs'));
      if (!logsDir.existsSync()) {
        await logsDir.create(recursive: true);
      }
      _logFile = File(p.join(logsDir.path, 'copycat.log'));
      await _rotateIfNeeded();
      _sink = _logFile!.openWrite(mode: FileMode.append);
      _flushTimer = Timer.periodic(_flushInterval, (_) => _flush());
      _initialized = true;

      write(
        'info',
        'FileLogSink',
        '--- Log session started (${DateTime.now().toIso8601String()}) ---',
      );
    } catch (e) {
      debugPrint('FileLogSink init failed: $e');
    }
  }

  Future<void> _rotateIfNeeded() async {
    final file = _logFile;
    if (file == null || !file.existsSync()) return;

    final size = await file.length();
    if (size <= _maxFileSize) return;

    try {
      final bytes = await file.readAsBytes();
      final keepFrom = bytes.length - _truncateTarget;
      if (keepFrom > 0) {
        await file.writeAsBytes(bytes.sublist(keepFrom), flush: true);
      }
    } catch (e) {
      debugPrint('FileLogSink rotation failed: $e');
    }
  }

  void write(String level, String? scope, String message) {
    if (!_initialized) return;

    final now = DateTime.now();
    final timestamp = _formatTimestamp(now);
    final scopePart = (scope != null && scope.isNotEmpty) ? '[$scope] ' : '';
    final line = '$timestamp [$level] $scopePart$message\n';

    _queue.add(line);
    _drain();
  }

  void _drain() {
    if (_flushing || _queue.isEmpty || _sink == null) return;
    try {
      while (_queue.isNotEmpty) {
        _sink!.write(_queue.first);
        _queue.removeFirst();
      }
    } catch (e) {
      debugPrint("FileLogSink - $e");
    }
  }

  void _flush() {
    _drain();
    final sink = _sink;
    if (_flushing || sink == null) return;
    _flushing = true;
    sink
        .flush()
        .catchError((Object e) {
          debugPrint("FileLogSink flush failed - $e");
        })
        .whenComplete(() {
          _flushing = false;
          if (_queue.isNotEmpty) _flush();
        });
  }

  /// Forces an immediate flush — call for error-level logs.
  void flushNow() => _flush();

  static String _formatTimestamp(DateTime time) {
    final y = time.year.toString();
    final mo = time.month.toString().padLeft(2, '0');
    final d = time.day.toString().padLeft(2, '0');
    final h = time.hour.toString().padLeft(2, '0');
    final m = time.minute.toString().padLeft(2, '0');
    final s = time.second.toString().padLeft(2, '0');
    final ms = time.millisecond.toString().padLeft(3, '0');
    return '$y-$mo-$d $h:$m:$s.$ms';
  }

  static Future<File?> getLogFile() async {
    if (instance._logFile != null && instance._logFile!.existsSync()) {
      instance.flushNow();
      return instance._logFile;
    }
    try {
      final dir = await getApplicationSupportDirectory();
      final file = File(p.join(dir.path, 'logs', 'copycat.log'));
      if (file.existsSync()) return file;
    } catch (_) {}
    return null;
  }
}
