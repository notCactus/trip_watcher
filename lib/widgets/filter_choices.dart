import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_watcher/providers/new_trip.dart';

class FilterChoices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 16,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Select the methods of travel',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 16,
              child: RotatedBox(
                quarterTurns: 1,
                child: Consumer<NewTrip>(
                  builder: (context, value, child) => ToggleButtons(
                    selectedColor: Colors.black,
                    fillColor: Colors.indigo.withOpacity(0.5),
                    children: <Widget>[
                      _toggleButton('Snabbtåg, Expresståg, Arlanda Express'),
                      _toggleButton('Regionaltåg, InterCitytåg'),
                      _toggleButton('Expressbuss, Flygbussar'),
                      _toggleButton('Lokaltåg, Pågatåg, Öresundståg'),
                      _toggleButton('Tunnelbana'),
                      _toggleButton('Spårvagn'),
                      _toggleButton('Buss'),
                      _toggleButton('Färja, Utrikes Färja'),
                      _toggleButton('Taxi'),
                    ],
                    isSelected: value.travelMethods,
                    onPressed: (int index) {
                      // Toggles the value.
                      value.setTravelMethodIndex(index, !value.travelMethods[index]);
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                // Hide the filter if the done text or area is clicked.
                Navigator.of(context).pop();
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 16,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Done',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  RotatedBox _toggleButton(String text) {
    return RotatedBox(
      quarterTurns: 3,
      child: Text(text),
    );
  }
}
