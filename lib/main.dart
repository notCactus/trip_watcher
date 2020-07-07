import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Only for dev.
import 'package:device_preview/device_preview.dart';

import 'pages/home_page.dart';
import 'providers/new_trip.dart';
import 'providers/trip_list.dart';

/*void main() => runApp(DevicePreview(
      builder: (context) => MyApp(),
    ));*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewTrip(),
        ),
        ChangeNotifierProvider(
          create: (context) => TripList(),
        ),
      ],
      child: MaterialApp(
        title: 'Trip Watcher',
        theme: ThemeData(
          primarySwatch: white,
          accentColor: Colors.lightBlue,
        ),
        home: HomePage(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
        },
      ),
    );
  }
}

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
