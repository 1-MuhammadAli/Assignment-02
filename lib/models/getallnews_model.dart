class GetAllNewsModel {
    String description;
    User user;
  GetAllNewsModel({
       required this.description,
       required this.user,});

  factory GetAllNewsModel.fromJson(Map<String, dynamic> json) {
   return GetAllNewsModel(
       description:json["description"],
       user :User.fromJson(json['user']),
       );
  }

}
class User {
   String firstName;
   String? profileImg;
  User({
    required this.firstName,
    required this.profileImg,
  });
  factory User.fromJson(Map<String, dynamic> json) {
   return User(
       firstName : json['first_name'],
       profileImg : json['profile_img']??'',
   );

  }

}