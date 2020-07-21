import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../models/stations.dart';
import 'debouncer.dart';
import 'devfile.dart';

/// Searches for the stations based off [query].
///
/// [suggestedStations] is returned whenever the query is empty.
/// [minQueryLength] min query length for the request to go to the api.
/// [maxQueryLength] max query length for the request to go to the api.
Future<Stations> fetchStations(String query, Stations suggestedStations,
    {int minQueryLength = 3, int maxQueryLength = 30}) async {
  if (["", null, false, 0].contains(query) ||
      query.length < minQueryLength ||
      query.length > maxQueryLength) {
    return suggestedStations;
  }

  const String _baseUrl =
      'https://api.resrobot.se/v2/location.name?key=${ApiKey.key}';
  String _url = _baseUrl + '&input=$query&format=json';
  print(_url);
  Stations _stationsList;

  try {
    final _resp = await http.get(_url);
    if (_resp.statusCode == 200) {
      _stationsList = Stations.fromJson(jsonDecode(_resp.body));

      return _stationsList;
    } else {
      print('Status Code: 404');
      return _stationsList;
    }
  } catch (e) {
    print(e);
  }
  return _stationsList;
}

// The debouncer
final _debouncer = Debouncer(milliseconds: 300);

/// A SearchDelegate for searching stations.
class StationSearcher extends SearchDelegate<StopLocation> {
  @override
  String get searchFieldLabel => 'Enter a station...';

  Stations _searchResult = Stations(
    stopLocation: [
    ],
  );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // The stations
    Future<Stations> stationsFuture;

    // The completer
    Completer completer = new Completer<Stations>();

    // The debouncing
    _debouncer.run(() async {
      completer.complete(await fetchStations(query, _searchResult));
    });

    stationsFuture = completer.future;

    return FutureBuilder(
      future: stationsFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            _searchResult = snapshot.data;
            return stationSuggestionsList(_searchResult, context,
                (ctx, newStopLocation) {
              close(ctx, newStopLocation);
            });
            break;
          default:
            return stationSuggestionsList(_searchResult, context,
                (ctx, newStopLocation) {
              close(ctx, newStopLocation);
            });
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // The stations
    Future<Stations> stationsFuture;

    // The completer
    Completer completer = new Completer<Stations>();

    // The debouncing
    _debouncer.run(() async {
      completer.complete(await fetchStations(query, _searchResult));
    });

    stationsFuture = completer.future;

    return FutureBuilder(
      future: stationsFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            _searchResult = snapshot.data;
            return stationSuggestionsList(_searchResult, context,
                (ctx, newStopLocation) {
              close(ctx, newStopLocation);
            });
            break;
          default:
            return stationSuggestionsList(_searchResult, context,
                (ctx, newStopLocation) {
              close(ctx, newStopLocation);
            });
        }
      },
    );
  }

  /// A list for displaying station suggestions based of [stationsList].
  ListView stationSuggestionsList(
      Stations stationsList, BuildContext context, Function onTapFunction) {
    return ListView.builder(
      itemBuilder: (context, i) => ListTile(
        onTap: () {
          onTapFunction(context, stationsList.stopLocation[i]);
        },
        leading: Icon(Icons.location_city),
        title: Text(stationsList.stopLocation[i].name),
      ),
      itemCount: stationsList.stopLocation.length,
    );
  }
}
