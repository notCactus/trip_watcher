import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'filter_choices.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => FilterChoices(),
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
          children: <Widget>[
            Icon(
              Icons.tune,
              color: Colors.lightBlue,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Filter',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
