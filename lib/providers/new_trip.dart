import 'package:flutter/foundation.dart';

import '../models/stations.dart';

/// Stores the latest trip.
class NewTrip with ChangeNotifier {
  StopLocation _fromStation = StopLocation(name: 'Tap to search...');
  StopLocation _toStation = StopLocation(name: 'Tap to search...');

  DateTime _dateAndTime = DateTime.now();

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

  /// Swaps [_fromStation] and [_toStation] with eachother.
  void swapStations() {
    StopLocation tempStation = _fromStation;
    _fromStation = _toStation;
    _toStation = tempStation;
    notifyListeners();
  }
}
