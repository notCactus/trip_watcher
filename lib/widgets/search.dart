import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_watcher/models/stations.dart';

import '../providers/new_trip.dart';
import '../utils/station_searcher.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey.withOpacity(0.3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ChooseStationButton(
                bottomPadding: 0,
                bottomLeftBorder: 0,
                bottomRightBorder: 0,
                fromButton: true,
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 6,
                endIndent: 6,
                height: 0,
              ),
              ChooseStationButton(
                topPadding: 0,
                topLeftBorder: 0,
                topRightBorder: 0,
                fromButton: false,
              )
            ],
          ),
        ),
        Positioned(
          top: 49,
          right: 15,
          child: Column(
            children: <Widget>[
              Text('from'),
              SizedBox(
                height: 12,
              ),
              RawMaterialButton(
                onPressed: () {},
                elevation: 6,
                fillColor: Colors.white,
                child: Icon(
                  Icons.swap_vert,
                  size: 28,
                  color: Colors.lightBlue,
                ),
                padding: EdgeInsets.all(6),
                shape: CircleBorder(),
              ),
              SizedBox(
                height: 12,
              ),
              Text('to'),
            ],
          ),
        ),
      ],
    );
  }
}

class ChooseStationButton extends StatefulWidget {
  final double topLeftBorder;
  final double topRightBorder;
  final double bottomLeftBorder;
  final double bottomRightBorder;
  final String subtitle;
  final double topPadding;
  final double bottomPadding;
  final bool fromButton;

  const ChooseStationButton({
    Key key,
    this.topLeftBorder = 8,
    this.topRightBorder = 8,
    this.bottomLeftBorder = 8,
    this.bottomRightBorder = 8,
    this.subtitle = 'City',
    this.topPadding = 6,
    this.bottomPadding = 6,
    this.fromButton = true,
  }) : super(key: key);

  @override
  _ChooseStationButtonState createState() => _ChooseStationButtonState();
}

class _ChooseStationButtonState extends State<ChooseStationButton> {
  String _title = 'Station';
  StopLocation _stopLocation;

  @override
  Widget build(BuildContext context) {
    // So that the provider can get updated.
    final newTrip = Provider.of<NewTrip>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(
          left: 6,
          right: 6,
          top: widget.topPadding,
          bottom: widget.bottomPadding),
      child: InkWell(
        onTap: () async {
          _stopLocation =
              await showSearch(context: context, delegate: StationSearcher());

          if (_stopLocation != null) {
            // Update the provider
            widget.fromButton
                ? newTrip.fromStation = _stopLocation
                : newTrip.toStation = _stopLocation;

            setState(() {
              _title = _stopLocation.name;
            });
          }

          //testing
          if (newTrip.fromStation != null) {
            print('from: ${newTrip.fromStation.name}');
          }
          if (newTrip.toStation != null) {
            print('to: ${newTrip.toStation.name}');
          }
        },
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.topLeftBorder),
            topRight: Radius.circular(widget.topRightBorder),
            bottomLeft: Radius.circular(widget.bottomLeftBorder),
            bottomRight: Radius.circular(widget.bottomRightBorder),
          )),
          child: ListTile(
            contentPadding:
                EdgeInsets.only(left: 16, right: 26, bottom: 8, top: 8),
            title: Text(
              _title,
              style: TextStyle(color: Colors.black, fontSize: 28),
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
            subtitle: Text(
              widget.subtitle,
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
