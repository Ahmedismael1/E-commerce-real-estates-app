class LoginModel {
  int status;
  String message;
  bool isUserFound;
  Data  data;

  LoginModel({this.status, this.message, this.isUserFound, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    isUserFound = json['is_user_found'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['is_user_found'] = this.isUserFound;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String lastName;
  String mobile;
  String email;
  String type;
  String countryCode;
  String createdAt;
  bool verified;
  String tokenType;
  String accessToken;
  String expiresAt;

  Data(
      {this.id,
        this.name,
        this.lastName,
        this.mobile,
        this.email,
        this.type,
        this.countryCode,
        this.createdAt,
        this.verified,
        this.tokenType,
        this.accessToken,
        this.expiresAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    countryCode = json['country_code'];
    createdAt = json['created_at'];
    verified = json['verified'];
    tokenType = json['token_type'];
    accessToken = json['access_token'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['type'] = this.type;
    data['country_code'] = this.countryCode;
    data['created_at'] = this.createdAt;
    data['verified'] = this.verified;
    data['token_type'] = this.tokenType;
    data['access_token'] = this.accessToken;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}
