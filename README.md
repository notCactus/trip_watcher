# Trip Watcher

An app that monitors departures for the public transportation in Stockholm, Sweden (SL). 

## Set up

1. Add your [TrafikLab](https://www.trafiklab.se/) "ReseRobot - Reseplanerare" API KEY by creating a file called "devfile.dart" at ```lib/utils```.
Code to be added to the "devfile.dart":
```dart
class ApiKey {
  static const key = 'YOUR_API_KEY';
}
```
2. Run the app.
