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
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  @disposeMethod
  void dispose() {
    _subscription.cancel();
  }
}
