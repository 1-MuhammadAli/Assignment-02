class AddNewsModel {
  int? id;
  String? title;
  String? description;
  int? userId;
  int? leagueId;
  String? createdAt;
  String? updatedAt;
  int? matchId;

  AddNewsModel(
      {this.id,
        this.title,
        this.description,
        this.userId,
        this.leagueId,
        this.createdAt,
        this.updatedAt,
        this.matchId});

  AddNewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    userId = json['user_id'];
    leagueId = json['league_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    matchId = json['match_id'];
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
    return data;
  }
}
