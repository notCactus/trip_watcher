import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trip_watcher/providers/new_trip.dart';

import '../models/trips.dart';
import '../utils/devfile.dart';
import '../widgets/add_button.dart';
import '../widgets/departure_time.dart';
import '../widgets/filter.dart';
import '../widgets/search.dart';
import '../widgets/trip_list.dart';
import '../providers/trip_list.dart' as tlp;

void _fetchTest(BuildContext context) async {
  var _newTrip = Provider.of<NewTrip>(context, listen: false);

  if (_newTrip.fromStation.id != null && _newTrip.toStation.id != null) {
    final List<String> _dateAndTime =
        DateFormat('yyyy-MM-dd HH:mm').format(_newTrip.dateAndTime).split(' ');

    const String _baseUrl =
        'https://api.resrobot.se/v2/trip.json?key=${ApiKey.key}';
    final String _url = _baseUrl +
        '&originId=${_newTrip.fromStation.id}&destId=${_newTrip.toStation.id}&passlist=0&date=${_dateAndTime[0]}&time=${_dateAndTime[1]}&products=${_newTrip.travelSum()}';
    Trips _tripsList;
    //print(_url);
    try {
      final _resp = await http.get(_url);
      //print(_resp.statusCode);
      if (_resp.statusCode == 200) {
        _tripsList = Trips.fromJson(jsonDecode(_resp.body));
        var tlProvider = Provider.of<tlp.TripList>(context, listen: false);
        tlProvider.addTrip(_tripsList);
      }
    } catch (e) {
      print(e);
    }
  }
}

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Search(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: DepartureTime(),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    flex: 1,
                    child: Filter(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            AddButton(
              onTapFunction: () => _fetchTest(context),
            ),
            SizedBox(
              height: 20,
            ),
            TripList(),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFECECEC),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.star,
          color: Colors.white,
        ),
      ),*/
    );
  }
}
