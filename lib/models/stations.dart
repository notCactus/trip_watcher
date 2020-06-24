class Stations {
  List<StopLocation> stopLocation;

  Stations({this.stopLocation});

  Stations.fromJson(Map<String, dynamic> json) {
    if (json['StopLocation'] != null) {
      stopLocation = new List<StopLocation>();
      json['StopLocation'].forEach((v) {
        stopLocation.add(new StopLocation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stopLocation != null) {
      data['StopLocation'] = this.stopLocation.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StopLocation {
  String id;
  String extId;
  String name;
  double lon;
  double lat;
  int weight;
  int products;

  StopLocation(
      {this.id,
      this.extId,
      this.name,
      this.lon,
      this.lat,
      this.weight,
      this.products});

  StopLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    extId = json['extId'];
    name = json['name'];
    lon = json['lon'];
    lat = json['lat'];
    weight = json['weight'];
    products = json['products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['extId'] = this.extId;
    data['name'] = this.name;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['weight'] = this.weight;
    data['products'] = this.products;
    return data;
  }
}