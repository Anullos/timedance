import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  Timer _timer;

  void run(VoidCallback callback) {
    _timer?.cancel(); // la interrogacion es si existe haces eso
    _timer = Timer(const Duration(seconds: 1), callback);
  }
}
