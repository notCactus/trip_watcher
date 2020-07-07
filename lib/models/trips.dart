class Trips {
  List<Trip> trip;
  String scrB;
  String scrF;

  Trips({this.trip, this.scrB, this.scrF});

  Trips.fromJson(Map<String, dynamic> json) {
    if (json['Trip'] != null) {
      trip = new List<Trip>();
      json['Trip'].forEach((v) {
        trip.add(new Trip.fromJson(v));
      });
    }
    scrB = json['scrB'];
    scrF = json['scrF'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trip != null) {
      data['Trip'] = this.trip.map((v) => v.toJson()).toList();
    }
    data['scrB'] = this.scrB;
    data['scrF'] = this.scrF;
    return data;
  }
}

class Trip {
  List<ServiceDays> serviceDays;
  LegList legList;
  int idx;
  String tripId;
  String ctxRecon;
  String duration;

  Trip(
      {this.serviceDays,
      this.legList,
      this.idx,
      this.tripId,
      this.ctxRecon,
      this.duration});

  Trip.fromJson(Map<String, dynamic> json) {
    if (json['ServiceDays'] != null) {
      serviceDays = new List<ServiceDays>();
      json['ServiceDays'].forEach((v) {
        serviceDays.add(new ServiceDays.fromJson(v));
      });
    }
    legList =
        json['LegList'] != null ? new LegList.fromJson(json['LegList']) : null;
    idx = json['idx'];
    tripId = json['tripId'];
    ctxRecon = json['ctxRecon'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceDays != null) {
      data['ServiceDays'] = this.serviceDays.map((v) => v.toJson()).toList();
    }
    if (this.legList != null) {
      data['LegList'] = this.legList.toJson();
    }
    data['idx'] = this.idx;
    data['tripId'] = this.tripId;
    data['ctxRecon'] = this.ctxRecon;
    data['duration'] = this.duration;
    return data;
  }
}

class ServiceDays {
  String planningPeriodBegin;
  String planningPeriodEnd;
  String sDaysR;
  String sDaysI;
  String sDaysB;

  ServiceDays(
      {this.planningPeriodBegin,
      this.planningPeriodEnd,
      this.sDaysR,
      this.sDaysI,
      this.sDaysB});

  ServiceDays.fromJson(Map<String, dynamic> json) {
    planningPeriodBegin = json['planningPeriodBegin'];
    planningPeriodEnd = json['planningPeriodEnd'];
    sDaysR = json['sDaysR'];
    sDaysI = json['sDaysI'];
    sDaysB = json['sDaysB'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planningPeriodBegin'] = this.planningPeriodBegin;
    data['planningPeriodEnd'] = this.planningPeriodEnd;
    data['sDaysR'] = this.sDaysR;
    data['sDaysI'] = this.sDaysI;
    data['sDaysB'] = this.sDaysB;
    return data;
  }
}

class LegList {
  List<Leg> leg;

  LegList({this.leg});

  LegList.fromJson(Map<String, dynamic> json) {
    if (json['Leg'] != null) {
      leg = new List<Leg>();
      json['Leg'].forEach((v) {
        leg.add(new Leg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leg != null) {
      data['Leg'] = this.leg.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leg {
  Origin origin;
  Origin destination;
  String idx;
  String name;
  String type;
  String duration;
  int dist;
  Product product;
  String transportNumber;
  String transportCategory;
  bool reachable;
  String direction;
  Notes notes;

  Leg(
      {this.origin,
      this.destination,
      this.idx,
      this.name,
      this.type,
      this.duration,
      this.dist,
      this.product,
      this.transportNumber,
      this.transportCategory,
      this.reachable,
      this.direction,
      this.notes});

  Leg.fromJson(Map<String, dynamic> json) {
    origin =
        json['Origin'] != null ? new Origin.fromJson(json['Origin']) : null;
    destination = json['Destination'] != null
        ? new Origin.fromJson(json['Destination'])
        : null;
    idx = json['idx'];
    name = json['name'];
    type = json['type'];
    duration = json['duration'];
    dist = json['dist'];
    product =
        json['Product'] != null ? new Product.fromJson(json['Product']) : null;
    transportNumber = json['transportNumber'];
    transportCategory = json['transportCategory'];
    reachable = json['reachable'];
    direction = json['direction'];
    notes = json['Notes'] != null ? new Notes.fromJson(json['Notes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.origin != null) {
      data['Origin'] = this.origin.toJson();
    }
    if (this.destination != null) {
      data['Destination'] = this.destination.toJson();
    }
    data['idx'] = this.idx;
    data['name'] = this.name;
    data['type'] = this.type;
    data['duration'] = this.duration;
    data['dist'] = this.dist;
    if (this.product != null) {
      data['Product'] = this.product.toJson();
    }
    data['transportNumber'] = this.transportNumber;
    data['transportCategory'] = this.transportCategory;
    data['reachable'] = this.reachable;
    data['direction'] = this.direction;
    if (this.notes != null) {
      data['Notes'] = this.notes.toJson();
    }
    return data;
  }
}

class Origin {
  String name;
  String type;
  String id;
  String extId;
  double lon;
  double lat;
  String time;
  String date;
  int routeIdx;

  Origin(
      {this.name,
      this.type,
      this.id,
      this.extId,
      this.lon,
      this.lat,
      this.time,
      this.date,
      this.routeIdx});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    id = json['id'];
    extId = json['extId'];
    lon = json['lon'];
    lat = json['lat'];
    time = json['time'];
    date = json['date'];
    routeIdx = json['routeIdx'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['id'] = this.id;
    data['extId'] = this.extId;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['time'] = this.time;
    data['date'] = this.date;
    data['routeIdx'] = this.routeIdx;
    return data;
  }
}

class Product {
  String name;
  String num;
  String catCode;
  String catOutS;
  String catOutL;
  String operatorCode;
  String operator;
  String operatorUrl;

  Product(
      {this.name,
      this.num,
      this.catCode,
      this.catOutS,
      this.catOutL,
      this.operatorCode,
      this.operator,
      this.operatorUrl});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    num = json['num'];
    catCode = json['catCode'];
    catOutS = json['catOutS'];
    catOutL = json['catOutL'];
    operatorCode = json['operatorCode'];
    operator = json['operator'];
    operatorUrl = json['operatorUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['num'] = this.num;
    data['catCode'] = this.catCode;
    data['catOutS'] = this.catOutS;
    data['catOutL'] = this.catOutL;
    data['operatorCode'] = this.operatorCode;
    data['operator'] = this.operator;
    data['operatorUrl'] = this.operatorUrl;
    return data;
  }
}

class Notes {
  List<Note> note;

  Notes({this.note});

  Notes.fromJson(Map<String, dynamic> json) {
    if (json['Note'] != null) {
      note = new List<Note>();
      json['Note'].forEach((v) {
        note.add(new Note.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.note != null) {
      data['Note'] = this.note.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Note {
  String value;
  String key;
  String type;
  int priority;
  int routeIdxFrom;
  int routeIdxTo;

  Note(
      {this.value,
      this.key,
      this.type,
      this.priority,
      this.routeIdxFrom,
      this.routeIdxTo});

  Note.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    key = json['key'];
    type = json['type'];
    priority = json['priority'];
    routeIdxFrom = json['routeIdxFrom'];
    routeIdxTo = json['routeIdxTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['key'] = this.key;
    data['type'] = this.type;
    data['priority'] = this.priority;
    data['routeIdxFrom'] = this.routeIdxFrom;
    data['routeIdxTo'] = this.routeIdxTo;
    return data;
  }
}