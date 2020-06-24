import 'package:flutter/foundation.dart';

import '../models/stations.dart';

/// Stores the latest trip.
class NewTrip with ChangeNotifier {
  StopLocation _fromStation;
  StopLocation _toStation;
  bool _inProgress;

  StopLocation get fromStation => _fromStation;

  StopLocation get toStation => _toStation;

  bool get inProgress => _inProgress;

  set fromStation(StopLocation newStation) {
    _fromStation = newStation;
    notifyListeners();
  }

  set toStation(StopLocation newStation) {
    _toStation = newStation;
    notifyListeners();
  }

  set inProgress(bool newProgress) {
    _inProgress = newProgress;
    notifyListeners();
  }
}
