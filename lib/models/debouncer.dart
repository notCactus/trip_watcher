import 'package:flutter/foundation.dart';
import 'dart:async';


/// Debounces a specified function in milliseconds.
/// 
/// '''dart
/// final _debouncer = Debouncer(milliseconds: 500);
/// 
/// onTextChange(String text) {
/// _debouncer.run(() => print(text));
/// }
/// '''
class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;
  Debouncer({this.milliseconds});
  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
