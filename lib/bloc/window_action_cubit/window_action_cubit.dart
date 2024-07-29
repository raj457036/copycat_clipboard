import 'package:bloc/bloc.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/widgets.dart';
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

  Future<void> reset() async {
    toggleCompact(reset: true);
    togglePinned(reset: true);
  }

  Future<void> togglePinned({bool reset = false}) async {
    final isPinned = reset ? true : await windowManager.isAlwaysOnTop();
    await windowManager.setAlwaysOnTop(!isPinned);
    emit(state.copyWith(pinned: !isPinned));
  }

  Future<void> toggleCompact({bool reset = false}) async {
    final compactMode =
        reset ? true : (await windowManager.getSize()) == compactWindowSize;
    await windowManager.setSize(
      compactMode ? initialWindowSize : compactWindowSize,
    );
    if (!compactMode) {
      final position = await calcWindowPosition(
        compactWindowSize,
        const Alignment(0.98, 0.0),
      );
      await windowManager.setPosition(position, animate: true);
    } else {
      await windowManager.center(animate: true);
    }
    emit(state.copyWith(compact: !compactMode));
  }
}
