import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

part 'sync_manager_cubit.freezed.dart';
part 'sync_manager_state.dart';

@singleton
class SyncManagerCubit extends Cubit<SyncManagerState> {
  final Isar db;

  late StreamSubscription<void> subscription;

  SyncManagerCubit(this.db) : super(const SyncManagerState.initial()) {
    subscription = db.clipboardItems.watchLazy().listen((event) {});
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
