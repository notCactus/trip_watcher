import 'package:flutter/foundation.dart';

import '../models/trips.dart';

/// Stores all of the saved trips.
class TripList with ChangeNotifier {
  List<Trips> _trips = [];

  List<Trips> get trips => _trips;

  void addTrip(Trips newTrip) {
    _trips.insert(0, newTrip);
    notifyListeners();
  }
}
