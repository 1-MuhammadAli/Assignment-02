class ForgotPassword {
  int? id;
  String? title;
  String? description;
  int? userId;
  int? leagueId;
  String? createdAt;
  String? updatedAt;
  int? matchId;
  User? user;

  ForgotPassword(
      {this.id,
        this.title,
        this.description,
        this.userId,
        this.leagueId,
        this.createdAt,
        this.updatedAt,
        this.matchId,
        this.user});

  ForgotPassword.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    userId = json['user_id'];
    leagueId = json['league_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    matchId = json['match_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['user_id'] = userId;
    data['league_id'] = leagueId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['match_id'] = matchId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? apiToken;
  String? notification;

  User(
      {this.id,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.firstName,
        this.apiToken,
        this.notification});

  User.fromJson(Map<String, dynamic> json) {
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
