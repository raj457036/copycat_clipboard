import 'dart:async';
import 'dart:collection';

/// Limits how many async operations run at once; waiters are served in order.
class Semaphore {
  Semaphore(this._permits) : assert(_permits > 0);

  int _permits;
  final Queue<Completer<void>> _waiters = Queue<Completer<void>>();

  Future<void> acquire() {
    if (_permits > 0) {
      _permits--;
      return Future<void>.value();
    }
    final Completer<void> waiter = Completer<void>();
    _waiters.add(waiter);
    return waiter.future;
  }

  void release() {
    if (_waiters.isNotEmpty) {
      _waiters.removeFirst().complete();
    } else {
      _permits++;
    }
  }
}
