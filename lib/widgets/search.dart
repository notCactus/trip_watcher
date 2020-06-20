import 'package:flutter/material.dart';

import 'package:trip_watcher/models/station_searcher.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: StationSearcher());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text('Search...', style: TextStyle(color: Colors.grey, fontSize: 30),),
              trailing: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
