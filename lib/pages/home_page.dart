import 'dart:convert';

import 'package:flutter/material.dart';

import '../widgets/search.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Search(),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFECECEC),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.star),
      ),
    );
  }
}
