import 'package:flutter/material.dart';

import '../models/trips.dart';

class TripInfo extends StatelessWidget {
  final Trips trip;

  const TripInfo({
    Key key,
    this.trip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _orig = trip.trip[0].legList.leg[0].origin.name;
    final String _dest = trip.trip[0].legList.leg[0].destination.name;

    /// The amount of trips to be displayed.
    ///
    /// Returns 5 at most.
    int _maxTripLength() {
      return trip.trip.length > 5 ? 5 : trip.trip.length;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      key: key,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('$_orig -> $_dest'),
          ),
          Divider(
            color: Colors.grey,
          ),
          for (var i = 0; i < _maxTripLength(); i++)
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${trip.trip[i].legList.leg[0].origin.time} -> ${trip.trip[i].legList.leg[0].destination.time}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                            '${trip.trip[i].duration.substring(2).replaceAll("M", " min").replaceAll("H", " hr")}'),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
