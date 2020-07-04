import 'package:flutter/foundation.dart';
import 'dart:math';

import '../models/stations.dart';

/// Stores the latest trip.
class NewTrip with ChangeNotifier {
  StopLocation _fromStation = StopLocation(name: 'Tap to search...');
  StopLocation _toStation = StopLocation(name: 'Tap to search...');

  DateTime _dateAndTime = DateTime.now();

  List<bool> _travelMethods = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  List<bool> get travelMethods => _travelMethods;

  DateTime get dateAndTime => _dateAndTime;

  StopLocation get fromStation => _fromStation;
  StopLocation get toStation => _toStation;

  set dateAndTime(DateTime newDateAndTime) {
    _dateAndTime = newDateAndTime;
    notifyListeners();
  }

  set fromStation(StopLocation newStation) {
    _fromStation = newStation;
    notifyListeners();
  }

  set toStation(StopLocation newStation) {
    _toStation = newStation;
    notifyListeners();
  }

  /// Replaces with [value] at [index].
  void setTravelMethodIndex(int index, bool value) {
    _travelMethods[index] = value;
    notifyListeners();
  }

  /// Swaps [_fromStation] and [_toStation] with eachother.
  void swapStations() {
    StopLocation tempStation = _fromStation;
    _fromStation = _toStation;
    _toStation = tempStation;
    notifyListeners();
  }

  /// Caclculates the sum of the travel methods.
  /// 
  /// This is used for the api call.
  int travelSum() {
    int sum = 0;
    for (int i = 0; i < _travelMethods.length; i++) {
      if (_travelMethods[i]) {
        sum = sum + pow(2, i+1);
      }
    }
    return sum;
  }
}
