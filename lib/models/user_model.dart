class UserModel {
  int? id;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  Null? lastName;
  Null? phone;
  Null? gender;
  Null? address;
  String? apiToken;
  Null? role;
  Null? dob;
  Null? profileImg;
  Null? coverImg;
  Null? provider;
  Null? uid;
  Null? language;
  String? notification;

  UserModel(
      {this.id,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.firstName,
        this.lastName,
        this.phone,
        this.gender,
        this.address,
        this.apiToken,
        this.role,
        this.dob,
        this.profileImg,
        this.coverImg,
        this.provider,
        this.uid,
        this.language,
        this.notification});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    gender = json['gender'];
    address = json['address'];
    apiToken = json['api_token'];
    role = json['role'];
    dob = json['dob'];
    profileImg = json['profile_img'];
    coverImg = json['cover_img'];
    provider = json['provider'];
    uid = json['uid'];
    language = json['language'];
    notification = json['notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['api_token'] = this.apiToken;
    data['role'] = this.role;
    data['dob'] = this.dob;
    data['profile_img'] = this.profileImg;
    data['cover_img'] = this.coverImg;
    data['provider'] = this.provider;
    data['uid'] = this.uid;
    data['language'] = this.language;
    data['notification'] = this.notification;
    return data;
  }
}