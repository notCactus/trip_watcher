import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/new_trip.dart';

class DepartureTime extends StatelessWidget {
  final String _departureSetting = 'Depart';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show the date time picker.
        showCupertinoModalPopup(
          context: context,
          builder: (context) => _datepicker(
            context: context,
            child: CupertinoDatePicker(
              use24hFormat: true,
              onDateTimeChanged: (value) {
                var newTrip = Provider.of<NewTrip>(context, listen: false);
                newTrip.dateAndTime = value;
              },
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 4,
          left: 8,
          right: 8,
          top: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.access_time,
              color: Colors.lightBlue,
            ),
            Text(_departureSetting),
            Consumer<NewTrip>(
              builder: (context, value, child) =>
                  Text(DateFormat('HH:mm').format(value.dateAndTime)),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}

Widget _datepicker({Widget child, BuildContext context}) {
  return Container(
    height: 220,
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          flex: 5,
          child: child,
        ),
        Divider(
          thickness: 1,
        ),
        Flexible(
          fit: FlexFit.loose,
          flex: 1,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // Hide the date time picker if the done text or area is clicked.
              Navigator.of(context).pop();
            },
            child: SizedBox.expand(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Done',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          decoration: TextDecoration.none),
                    ),
                    // Padding for the bottom.
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
