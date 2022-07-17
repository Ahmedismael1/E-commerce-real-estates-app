class SearchModel {
  int status;
  String massage;
  List<SearchData> data;
  Links links;
  Meta meta;

  SearchModel({this.status, this.massage, this.data, this.links, this.meta});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['massage'];
    if (json['data'] != null) {
      data = <SearchData>[];
      json['data'].forEach((v) {
        data.add(new SearchData.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['massage'] = this.massage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class SearchData {
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

  SearchData(
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

  SearchData.fromJson(Map<String, dynamic> json) {
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

class Links {
  String first;
  String last;
  Null prev;
  String next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
