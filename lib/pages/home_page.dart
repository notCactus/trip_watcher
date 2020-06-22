import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/devfile.dart';
import '../widgets/search.dart';
import '../models/stations.dart';

Future<Stations> fetchStations() async {
  const String baseUrl =
      'https://api.resrobot.se/v2/location.name?key=${apiKey.key}';
  String url = baseUrl + '&input=Fridhems&format=json';

  Stations stationsList;

  try {
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      stationsList = Stations.fromJson(jsonDecode(resp.body));

      return stationsList;
    } else {
      print('Status Code: 404');
      return stationsList;
    }
  } catch (e) {
    print(e);
  }
}

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Search(),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFECECEC),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Stations stations = await fetchStations();
          print(stations.stopLocation[0].id);
        },
        child: const Icon(Icons.star),
      ),
    );
  }
}
