import 'dart:async';

import 'package:clipboard/base/constants/strings.dart';
import 'package:clipboard/base/domain/model/clip_collection/clipcollection.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/domain/services/cross_sync_listener.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

mixin SBCrossSyncListenerStatusChangeMixin<T> {
  bool get shouldReconnect =>
      currentStatus == CrossSyncListenerStatus.disconnected ||
      currentStatus == CrossSyncListenerStatus.error ||
      currentStatus == CrossSyncListenerStatus.unknown;

  CrossSyncListenerStatus _lastStatus = CrossSyncListenerStatus.unknown;
  final StreamController<CrossSyncStatusEvent> _statusEvents =
      StreamController<CrossSyncStatusEvent>.broadcast();
  final StreamController<CrossSyncEvent<T>> _changesStream =
      StreamController<CrossSyncEvent<T>>.broadcast();

  CrossSyncListenerStatus get currentStatus => _lastStatus;
  Stream<CrossSyncStatusEvent> get onStatusChange => _statusEvents.stream;
  Stream<CrossSyncEvent<T>> get onChangeEvent => _changesStream.stream;

  Future<T?> castToType(Object? obj);

  void _onStatusChange(RealtimeSubscribeStatus status, Object? obj) {
    switch (status) {
      case RealtimeSubscribeStatus.subscribed:
        _lastStatus = CrossSyncListenerStatus.connected;
        _statusEvents.add((CrossSyncListenerStatus.connected, obj));
      case RealtimeSubscribeStatus.channelError:
        logger.w("Realtime channel error: $obj");
        _lastStatus = CrossSyncListenerStatus.error;
        _statusEvents.add((CrossSyncListenerStatus.error, obj));
      case RealtimeSubscribeStatus.closed:
        logger.w("Realtime channel closed: $obj");
        _lastStatus = CrossSyncListenerStatus.disconnected;
        _statusEvents.add((CrossSyncListenerStatus.disconnected, obj));
      case RealtimeSubscribeStatus.timedOut:
        logger.w("Realtime channel timed out: $obj");
        _lastStatus = CrossSyncListenerStatus.disconnected;
        _statusEvents.add((CrossSyncListenerStatus.disconnected, obj));
    }
  }

  Future<void> _onChange(PostgresChangePayload payload) async {
    try {
      switch (payload.eventType) {
        case PostgresChangeEvent.insert:
          final item = await castToType(payload.newRecord);
          if (item != null) {
            _changesStream.add((CrossSyncEventType.create, item));
          }
        case PostgresChangeEvent.update:
          final item = await castToType(payload.newRecord);
          if (item != null) {
            _changesStream.add((CrossSyncEventType.update, item));
          }
        // Deletes are intentionally not subscribed: clients only soft-delete
        // (an UPDATE with deletedAt), and hard deletes come from server-side
        // retention cleanup whose payload carries only the primary key.
        default:
      }
    } catch (e, stack) {
      logger.e("Error processing realtime change: $e", stackTrace: stack);
    }
  }

  void dispose() {
    _statusEvents.close();
    _changesStream.close();
  }
}

@LazySingleton(as: ClipCrossSyncListener)
class SBClipCrossSyncListener
    with SBCrossSyncListenerStatusChangeMixin<ClipboardItem>
    implements ClipCrossSyncListener {
  RealtimeChannel? _channel;
  final String channelID = "clips-rtc";
  final SupabaseClient client;
  final String deviceId;

  SBClipCrossSyncListener(this.client, @Named("device_id") this.deviceId) {
    _statusEvents.add((CrossSyncListenerStatus.unknown, null));
  }

  @override
  bool get isInitiated => _channel != null;

  @override
  Future<void> start() async {
    if (isInitiated) return;
    _lastStatus = CrossSyncListenerStatus.connecting;
    _statusEvents.add((CrossSyncListenerStatus.connecting, null));
    _channel = client.channel(
      channelID,
      opts: const RealtimeChannelConfig(ack: false),
    );

    _channel
        ?.onPostgresChanges(
          schema: 'public',
          event: PostgresChangeEvent.insert,
          table: clipItemTable,
          callback: _onChange,
        )
        .onPostgresChanges(
          schema: 'public',
          event: PostgresChangeEvent.update,
          table: clipItemTable,
          callback: _onChange,
        )
        .subscribe(_onStatusChange);
  }

  @override
  Future<void> stop() async {
    final channel = _channel;
    _channel = null;
    _lastStatus = CrossSyncListenerStatus.disconnected;
    _statusEvents.add((CrossSyncListenerStatus.disconnected, null));
    if (channel != null) {
      try {
        await client.removeChannel(channel).timeout(const Duration(seconds: 2));
      } catch (e) {
        logger.w("Error removing realtime channel ($channelID): $e");
      }
    }
  }

  @override
  Future<void> reconnect({bool force = false}) async {
    if (!force && !shouldReconnect) return;

    await stop();
    await wait(const Duration(milliseconds: 200).inMilliseconds);
    await start();
  }

  @override
  Future<ClipboardItem?> castToType(Object? obj) async {
    try {
      if (obj == null) return null;
      final item = ClipboardItem.fromJson(obj as Map<String, dynamic>);
      if (item.locked) return item;
      return await item.decrypt();
    } catch (e) {
      logger.e("Error casting/decrypting ClipboardItem: $e");
      return null;
    }
  }
}

@LazySingleton(as: CollectionCrossSyncListener)
class SBCollectionCrossSyncListener
    with SBCrossSyncListenerStatusChangeMixin<ClipCollection>
    implements CollectionCrossSyncListener {
  RealtimeChannel? _channel;
  final String channelID = "collection-rtc";
  final SupabaseClient client;
  final String deviceId;

  SBCollectionCrossSyncListener(
    this.client,
    @Named("device_id") this.deviceId,
  ) {
    _statusEvents.add((CrossSyncListenerStatus.unknown, null));
  }

  @override
  bool get isInitiated => _channel != null;

  @override
  Future<void> start() async {
    if (isInitiated) return;
    _lastStatus = CrossSyncListenerStatus.connecting;
    _statusEvents.add((CrossSyncListenerStatus.connecting, null));
    _channel = client.channel(
      channelID,
      opts: const RealtimeChannelConfig(ack: false),
    );

    _channel
        ?.onPostgresChanges(
          schema: 'public',
          event: PostgresChangeEvent.insert,
          table: clipCollectionTable,
          callback: _onChange,
        )
        .onPostgresChanges(
          schema: 'public',
          event: PostgresChangeEvent.update,
          table: clipCollectionTable,
          callback: _onChange,
        )
        .subscribe(_onStatusChange);
  }

  @override
  Future<void> stop() async {
    final channel = _channel;
    _channel = null;
    _lastStatus = CrossSyncListenerStatus.disconnected;
    _statusEvents.add((CrossSyncListenerStatus.disconnected, null));
    if (channel != null) {
      try {
        await client.removeChannel(channel).timeout(const Duration(seconds: 2));
      } catch (e) {
        logger.w("Error removing realtime channel ($channelID): $e");
      }
    }
  }

  @override
  Future<void> reconnect({bool force = false}) async {
    if (!force && !shouldReconnect) return;

    await stop();
    await wait(const Duration(milliseconds: 200).inMilliseconds);
    await start();
  }

  @override
  Future<ClipCollection?> castToType(Object? obj) async {
    try {
      if (obj == null) return null;
      return ClipCollection.fromJson(obj as Map<String, dynamic>);
    } catch (e) {
      logger.e("Error casting ClipCollection: $e");
      return null;
    }
  }
}
