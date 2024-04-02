import 'package:bloc/bloc.dart';
import 'package:clipboard/common/logging.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.info('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.info("onEvent -- $event");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.severe("onError -- ${bloc.runtimeType}, $error", error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.info("onChange -- $change");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.info("Transition -- $transition");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.info('onClose -- ${bloc.runtimeType}');
  }
}
