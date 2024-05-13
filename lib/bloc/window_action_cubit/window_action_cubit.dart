import 'package:bloc/bloc.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:window_manager/window_manager.dart';

part 'window_action_cubit.freezed.dart';
part 'window_action_state.dart';

@injectable
class WindowActionCubit extends Cubit<WindowActionState> {
  WindowActionCubit() : super(const WindowActionState.loaded());

  Future<void> fetch() async {
    final isPinned = await windowManager.isAlwaysOnTop();
    final compactMode = (await windowManager.getSize()) == compactWindowSize;

    emit(
      WindowActionState.loaded(
        pinned: isPinned,
        compact: compactMode,
        loading: false,
      ),
    );
  }

  Future<void> togglePinned() async {
    final isPinned = await windowManager.isAlwaysOnTop();
    await windowManager.setAlwaysOnTop(!isPinned);
    emit(state.copyWith(pinned: !isPinned));
  }

  Future<void> toggleCompact() async {
    final compactMode = (await windowManager.getSize()) == compactWindowSize;
    await windowManager.setSize(
      compactMode ? initialWindowSize : compactWindowSize,
    );
    if (!compactMode) {
      await windowManager.setPosition(const Offset(1061.0, 61.0),
          animate: true);
    } else {
      await windowManager.center(animate: true);
    }
    emit(state.copyWith(compact: !compactMode));
  }
}
