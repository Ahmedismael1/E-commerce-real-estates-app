class PropertyDetailsModel {
  int status;
  String message;
  DetailsData data;

  PropertyDetailsModel({this.status, this.message, this.data});

  PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new DetailsData.fromJson(json['data']) : null;
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

class DetailsData {
  int id;
  String name;
  String description;
  int price;
  String city;
  int views;
  int clicked;
  int rentType;
  int payment;
  int activityType;
  int guest;
  String availability;
  int room;
  int bathroom;
  int area;
  int park;
  int rental;
  int furnished;
  String type;
  String url;
  String youtube;
  String lat;
  String lng;
  bool isFavourites;
  int noteId;
  String note;
  String createdAt;

  Owner owner;
  List<SimilarProject> similarProject;

  DetailsData(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.city,
        this.views,
        this.clicked,
        this.rentType,
        this.payment,
        this.activityType,
        this.guest,
        this.availability,
        this.room,
        this.bathroom,
        this.area,
        this.park,
        this.rental,
        this.furnished,
        this.type,
        this.url,
        this.youtube,
        this.lat,
        this.lng,
        this.isFavourites,
        this.noteId,
        this.note,
        this.createdAt,

        this.owner,
        this.similarProject});

  DetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    city = json['city'];
    views = json['views'];
    clicked = json['clicked'];
    rentType = json['rent_type'];
    payment = json['payment'];
    activityType = json['activity_type'];
    guest = json['guest'];
    availability = json['availability'];
    room = json['room'];
    bathroom = json['bathroom'];
    area = json['area'];
    park = json['park'];
    rental = json['rental'];
    furnished = json['furnished'];
    type = json['type'];
    url = json['url'];
    youtube = json['youtube'];
    lat = json['lat'];
    lng = json['lng'];
    isFavourites = json['is_favourites'];
    noteId = json['note_id'];
    note = json['note'];
    createdAt = json['created_at'];



    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    if (json['similar project'] != null) {
      similarProject = <SimilarProject>[];
      json['similar project'].forEach((v) {
        similarProject.add(new SimilarProject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['city'] = this.city;
    data['views'] = this.views;
    data['clicked'] = this.clicked;
    data['rent_type'] = this.rentType;
    data['payment'] = this.payment;
    data['activity_type'] = this.activityType;
    data['guest'] = this.guest;
    data['availability'] = this.availability;
    data['room'] = this.room;
    data['bathroom'] = this.bathroom;
    data['area'] = this.area;
    data['park'] = this.park;
    data['rental'] = this.rental;
    data['furnished'] = this.furnished;
    data['type'] = this.type;
    data['url'] = this.url;
    data['youtube'] = this.youtube;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['is_favourites'] = this.isFavourites;
    data['note_id'] = this.noteId;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;

    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    if (this.similarProject != null) {
      data['similar project'] =
          this.similarProject.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Owner {
  int id;
  String name;
  String mobile;
  String email;

  Owner({this.id, this.name, this.mobile, this.email, });

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    return data;
  }
}

class SimilarProject {
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

  SimilarProject(
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

  SimilarProject.fromJson(Map<String, dynamic> json) {
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
