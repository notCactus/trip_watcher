import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/trip_list.dart' as tlp;
import '../models/trips.dart';
import 'tripInfo.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {

  @override
  Widget build(BuildContext context) {
    List<Trips> _tripList =
        Provider.of<tlp.TripList>(context, listen: false).trips;
    return Expanded(
      child: ReorderableListView(
        children: [
          for (final trip in _tripList)
          TripInfo(trip: trip,key: ValueKey(trip),)
        ],
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > _tripList.length) {
              newIndex = _tripList.length;
            }
            if (newIndex > oldIndex) {
              newIndex--;
            }
            final item = _tripList.removeAt(oldIndex);
            _tripList.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
