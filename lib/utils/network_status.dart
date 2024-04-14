import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

@lazySingleton
class NetworkStatus {
  NetworkStatus() {
    _subscription = InternetConnection().onStatusChange.listen(
      (InternetStatus status) {
        switch (status) {
          case InternetStatus.connected:
            _isConnected = true;
            break;
          case InternetStatus.disconnected:
            _isConnected = false;
            break;
        }
      },
    );
  }

  late final StreamSubscription<InternetStatus> _subscription;
  bool? _isConnected;

  Future<bool> get isConnected async {
    if (_isConnected != null) {
      return _isConnected!;
    }
    _isConnected = await InternetConnection().hasInternetAccess;
    return _isConnected!;
  }

  @disposeMethod
  void dispose() {
    _subscription.cancel();
  }
}
