/// id : 41
/// title : "ABC2"
/// description : "This is test news for world cup"
/// user_id : 36
/// league_id : 31
/// created_at : "2022-10-13T06:11:47.412Z"
/// updated_at : "2022-10-13T06:11:47.412Z"
/// match_id : 1
/// user : {"id":36,"email":"ali@mailinator.com","created_at":"2022-10-05T11:17:31.247Z","updated_at":"2022-10-13T06:10:53.412Z","first_name":"ali","last_name":null,"phone":null,"gender":null,"address":null,"api_token":"noO0TRfSQlQJ6HvQ2mqeOQtt","role":null,"dob":null,"profile_img":null,"cover_img":null,"provider":null,"uid":null,"language":null,"notification":"OFF"}

class GnModel {
  GnModel({
      num? id, 
      String? title, 
      String? description, 
      num? userId, 
      num? leagueId, 
      String? createdAt, 
      String? updatedAt, 
      num? matchId, 
      User? user,}){
    _id = id;
    _title = title;
    _description = description;
    _userId = userId;
    _leagueId = leagueId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _matchId = matchId;
    _user = user;
}

  GnModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _userId = json['user_id'];
    _leagueId = json['league_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _matchId = json['match_id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  num? _id;
  String? _title;
  String? _description;
  num? _userId;
  num? _leagueId;
  String? _createdAt;
  String? _updatedAt;
  num? _matchId;
  User? _user;
GnModel copyWith({  num? id,
  String? title,
  String? description,
  num? userId,
  num? leagueId,
  String? createdAt,
  String? updatedAt,
  num? matchId,
  User? user,
}) => GnModel(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  userId: userId ?? _userId,
  leagueId: leagueId ?? _leagueId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  matchId: matchId ?? _matchId,
  user: user ?? _user,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  num? get userId => _userId;
  num? get leagueId => _leagueId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get matchId => _matchId;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['user_id'] = _userId;
    map['league_id'] = _leagueId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['match_id'] = _matchId;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 36
/// email : "ali@mailinator.com"
/// created_at : "2022-10-05T11:17:31.247Z"
/// updated_at : "2022-10-13T06:10:53.412Z"
/// first_name : "ali"
/// last_name : null
/// phone : null
/// gender : null
/// address : null
/// api_token : "noO0TRfSQlQJ6HvQ2mqeOQtt"
/// role : null
/// dob : null
/// profile_img : null
/// cover_img : null
/// provider : null
/// uid : null
/// language : null
/// notification : "OFF"

class User {
  User({
      num? id, 
      String? email, 
      String? createdAt, 
      String? updatedAt, 
      String? firstName, 
      dynamic lastName, 
      dynamic phone, 
      dynamic gender, 
      dynamic address, 
      String? apiToken, 
      dynamic role, 
      dynamic dob, 
      dynamic profileImg, 
      dynamic coverImg, 
      dynamic provider, 
      dynamic uid, 
      dynamic language, 
      String? notification,}){
    _id = id;
    _email = email;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _gender = gender;
    _address = address;
    _apiToken = apiToken;
    _role = role;
    _dob = dob;
    _profileImg = profileImg;
    _coverImg = coverImg;
    _provider = provider;
    _uid = uid;
    _language = language;
    _notification = notification;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phone = json['phone'];
    _gender = json['gender'];
    _address = json['address'];
    _apiToken = json['api_token'];
    _role = json['role'];
    _dob = json['dob'];
    _profileImg = json['profile_img'];
    _coverImg = json['cover_img'];
    _provider = json['provider'];
    _uid = json['uid'];
    _language = json['language'];
    _notification = json['notification'];
  }
  num? _id;
  String? _email;
  String? _createdAt;
  String? _updatedAt;
  String? _firstName;
  dynamic _lastName;
  dynamic _phone;
  dynamic _gender;
  dynamic _address;
  String? _apiToken;
  dynamic _role;
  dynamic _dob;
  dynamic _profileImg;
  dynamic _coverImg;
  dynamic _provider;
  dynamic _uid;
  dynamic _language;
  String? _notification;
User copyWith({  num? id,
  String? email,
  String? createdAt,
  String? updatedAt,
  String? firstName,
  dynamic lastName,
  dynamic phone,
  dynamic gender,
  dynamic address,
  String? apiToken,
  dynamic role,
  dynamic dob,
  dynamic profileImg,
  dynamic coverImg,
  dynamic provider,
  dynamic uid,
  dynamic language,
  String? notification,
}) => User(  id: id ?? _id,
  email: email ?? _email,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  phone: phone ?? _phone,
  gender: gender ?? _gender,
  address: address ?? _address,
  apiToken: apiToken ?? _apiToken,
  role: role ?? _role,
  dob: dob ?? _dob,
  profileImg: profileImg ?? _profileImg,
  coverImg: coverImg ?? _coverImg,
  provider: provider ?? _provider,
  uid: uid ?? _uid,
  language: language ?? _language,
  notification: notification ?? _notification,
);
  num? get id => _id;
  String? get email => _email;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get firstName => _firstName;
  dynamic get lastName => _lastName;
  dynamic get phone => _phone;
  dynamic get gender => _gender;
  dynamic get address => _address;
  String? get apiToken => _apiToken;
  dynamic get role => _role;
  dynamic get dob => _dob;
  dynamic get profileImg => _profileImg;
  dynamic get coverImg => _coverImg;
  dynamic get provider => _provider;
  dynamic get uid => _uid;
  dynamic get language => _language;
  String? get notification => _notification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone'] = _phone;
    map['gender'] = _gender;
    map['address'] = _address;
    map['api_token'] = _apiToken;
    map['role'] = _role;
    map['dob'] = _dob;
    map['profile_img'] = _profileImg;
    map['cover_img'] = _coverImg;
    map['provider'] = _provider;
    map['uid'] = _uid;
    map['language'] = _language;
    map['notification'] = _notification;
    return map;
  }

}