// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis/drive/v3.dart' as gd;
import 'package:injectable/injectable.dart';

part 'gdrive_sync_cubit.freezed.dart';
part 'gdrive_sync_state.dart';

@singleton
class GdriveSyncCubit extends Cubit<GdriveSyncState> {
  final AuthCubit auth;

  GdriveSyncCubit(
    this.auth,
  ) : super(const GdriveSyncState.initial());

  Future<void> uploadFile(ClipboardItem item) async {
    if (item.localPath == null) return;

    final session = await auth.getSession();

    final file = File(item.localPath!);
    final length = await file.length();
    final media =
        gd.Media(file.readAsBytes().asStream().asBroadcastStream(), length);
  }
}
