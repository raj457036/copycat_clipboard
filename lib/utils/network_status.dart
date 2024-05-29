import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Stream<bool> get networkObserver => InternetConnection().onStatusChange.map(
      (event) {
        return switch (event) {
          InternetStatus.connected => true,
          InternetStatus.disconnected => false,
        };
      },
    );
