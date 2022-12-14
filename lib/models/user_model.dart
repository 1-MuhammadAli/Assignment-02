class UserModel {
  int? id;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? apiToken;
  String? notification;

  UserModel(
      {this.id,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.firstName,
        this.apiToken,
        this.notification});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    apiToken = json['api_token'];
    notification = json['notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['first_name'] = firstName;
    data['api_token'] = apiToken;
    data['notification'] = notification;
    return data;
  }
}