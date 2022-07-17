class HomeModel {
  int status;
  String message;
  Data data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Projects> projects;
  List<Cities> cities;
  List<Properties> properties;
  int propertiesMinPrice;
  int propertiesMaxPrice;
  int propertiesMinArea;
  int propertiesMaxArea;

  Data(
      {this.projects,
        this.cities,
        this.properties,
        this.propertiesMinPrice,
        this.propertiesMaxPrice,
        this.propertiesMinArea,
        this.propertiesMaxArea});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects.add(new Projects.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities.add(new Cities.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties.add(new Properties.fromJson(v));
      });
    }
    propertiesMinPrice = json['properties_min_price'];
    propertiesMaxPrice = json['properties_max_price'];
    propertiesMinArea = json['properties_min_area'];
    propertiesMaxArea = json['properties_max_area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects.map((v) => v.toJson()).toList();
    }
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    if (this.properties != null) {
      data['properties'] = this.properties.map((v) => v.toJson()).toList();
    }
    data['properties_min_price'] = this.propertiesMinPrice;
    data['properties_max_price'] = this.propertiesMaxPrice;
    data['properties_min_area'] = this.propertiesMinArea;
    data['properties_max_area'] = this.propertiesMaxArea;
    return data;
  }
}

class Projects {
  int id;
  String name;
  bool isFeatured;
  String city;
  String devolper;
  List<Null> activityTypes;
  String image;

  Projects(
      {this.id,
        this.name,
        this.isFeatured,
        this.city,
        this.devolper,
        this.activityTypes,
        this.image});

  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isFeatured = json['is_featured'];
    city = json['city'];
    devolper = json['devolper'];

    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_featured'] = this.isFeatured;
    data['city'] = this.city;
    data['devolper'] = this.devolper;

    data['image'] = this.image;
    return data;
  }
}

class Cities {
  int id;
  String name;
  bool isFeatured;
  String image;
  Governorate governorate;

  Cities({this.id, this.name, this.isFeatured, this.image, this.governorate});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isFeatured = json['is_featured'];
    image = json['image'];
    governorate = json['governorate'] != null
        ? new Governorate.fromJson(json['governorate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_featured'] = this.isFeatured;
    data['image'] = this.image;
    if (this.governorate != null) {
      data['governorate'] = this.governorate.toJson();
    }
    return data;
  }
}

class Governorate {
  int id;
  String name;

  Governorate({this.id, this.name});

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Properties {
  int id;
  String name;
  String type;
  int price;
  String city;
  int views;
  int clicked;
  int rentType;
  int activityType;
  int area;
  int room;
  int bathroom;
  int guest;
  String availability;
  bool isFeatured;
  int rental;
  String lat;
  String lng;
  int furnished;
  bool isFavourites;
  int noteId;
  String note;
  String createdAt;
  String expireAt;
  String image;

  Properties(
      {this.id,
        this.name,
        this.type,
        this.price,
        this.city,
        this.views,
        this.clicked,
        this.rentType,
        this.activityType,
        this.area,
        this.room,
        this.bathroom,
        this.guest,
        this.availability,
        this.isFeatured,
        this.rental,
        this.lat,
        this.lng,
        this.furnished,
        this.isFavourites,
        this.noteId,
        this.note,
        this.createdAt,
        this.expireAt,
        this.image});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    city = json['city'];
    views = json['views'];
    clicked = json['clicked'];
    rentType = json['rent_type'];
    activityType = json['activity_type'];
    area = json['area'];
    room = json['room'];
    bathroom = json['bathroom'];
    guest = json['guest'];
    availability = json['availability'];
    isFeatured = json['is_featured'];
    rental = json['rental'];
    lat = json['lat'];
    lng = json['lng'];
    furnished = json['furnished'];
    isFavourites = json['is_favourites'];
    noteId = json['note_id'];
    note = json['note'];
    createdAt = json['created_at'];
    expireAt = json['expire_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['price'] = this.price;
    data['city'] = this.city;
    data['views'] = this.views;
    data['clicked'] = this.clicked;
    data['rent_type'] = this.rentType;
    data['activity_type'] = this.activityType;
    data['area'] = this.area;
    data['room'] = this.room;
    data['bathroom'] = this.bathroom;
    data['guest'] = this.guest;
    data['availability'] = this.availability;
    data['is_featured'] = this.isFeatured;
    data['rental'] = this.rental;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['furnished'] = this.furnished;
    data['is_favourites'] = this.isFavourites;
    data['note_id'] = this.noteId;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['expire_at'] = this.expireAt;
    data['image'] = this.image;
    return data;
  }
}