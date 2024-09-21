import 'dart:async';

import 'package:flutter/scheduler.dart';

class Debounce {
  Timer? _timer;
  final Duration debounceDuration;

  Debounce({
    this.debounceDuration = const Duration(milliseconds: 500),
  });

  bool get isActive => _timer?.isActive ?? false;

  void dispose() {
    cancel();
    _timer = null;
  }

  void cancel() {
    _timer?.cancel();
  }

  void run(VoidCallback callback) {
    cancel();
    _timer = Timer(debounceDuration, callback);
  }
}
