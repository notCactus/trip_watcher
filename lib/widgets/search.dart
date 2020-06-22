import 'package:flutter/material.dart';

import '../utils/station_searcher.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
      child: InkWell(
        onTap: () {
          showSearch(context: context, delegate: StationSearcher());
        },
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListTile(
              title: Text(
                'Enter a station...',
                style: TextStyle(color: Colors.grey, fontSize: 30),
              ),
              trailing: Icon(
                Icons.search,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
