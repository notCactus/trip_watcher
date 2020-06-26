import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DepartureTime extends StatelessWidget {
  String _departureSetting = 'Depart';
  String _time = '12:56';

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => _datepicker(
            child: CupertinoDatePicker(
              use24hFormat: true,
              onDateTimeChanged: (value) {},
            ),
          ),
        );
      },
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.access_time,color: Colors.lightBlue,),
          Text(_departureSetting),
          Text(_time),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}

Widget _datepicker({Widget child}) {
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
            onTap: () {
              print('TAAAAAAAAAAAP!');
            },
            child: Container(
              child: Text(
                'Done',
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w100),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
