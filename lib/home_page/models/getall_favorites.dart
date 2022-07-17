class GetAllFavouriteModel {
  int status;
  String massage;
  List<Data> data;


  GetAllFavouriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['massage'];
    print("out");
    if (json['data'] != null) {
      print("in");

      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }


}

class Data {
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

  Data.fromJson(Map<String, dynamic> json) {
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

}
