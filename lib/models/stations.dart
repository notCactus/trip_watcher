class Stations {
  List<StopLocation> _stopLocation;

  Stations({List<StopLocation> stopLocation}) {
    this._stopLocation = stopLocation;
  }

  List<StopLocation> get stopLocation => _stopLocation;
  set stopLocation(List<StopLocation> stopLocation) =>
      _stopLocation = stopLocation;

  Stations.fromJson(Map<String, dynamic> json) {
    if (json['StopLocation'] != null) {
      _stopLocation = new List<StopLocation>();
      json['StopLocation'].forEach((v) {
        _stopLocation.add(new StopLocation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._stopLocation != null) {
      data['StopLocation'] = this._stopLocation.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StopLocation {
  String _id;
  String _extId;
  String _name;
  double _lon;
  double _lat;
  int _weight;
  int _products;

  StopLocation(
      {String id,
      String extId,
      String name,
      double lon,
      double lat,
      int weight,
      int products}) {
    this._id = id;
    this._extId = extId;
    this._name = name;
    this._lon = lon;
    this._lat = lat;
    this._weight = weight;
    this._products = products;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get extId => _extId;
  set extId(String extId) => _extId = extId;
  String get name => _name;
  set name(String name) => _name = name;
  double get lon => _lon;
  set lon(double lon) => _lon = lon;
  double get lat => _lat;
  set lat(double lat) => _lat = lat;
  int get weight => _weight;
  set weight(int weight) => _weight = weight;
  int get products => _products;
  set products(int products) => _products = products;

  StopLocation.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _extId = json['extId'];
    _name = json['name'];
    _lon = json['lon'];
    _lat = json['lat'];
    _weight = json['weight'];
    _products = json['products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['extId'] = this._extId;
    data['name'] = this._name;
    data['lon'] = this._lon;
    data['lat'] = this._lat;
    data['weight'] = this._weight;
    data['products'] = this._products;
    return data;
  }
}
