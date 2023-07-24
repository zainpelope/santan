class Plant {
  Plant({
    this.id,
    this.uuid,
    this.name,
    this.description,
    this.farmerTime,
    this.image,
    this.season,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  Plant.fromJson(dynamic json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    description = json['description'];
    farmerTime = json['farmer_time'];
    image = json['images'];
    season = json['season'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  num? id;
  String? uuid;
  String? name;
  String? description;
  String? farmerTime;
  String? image;
  String? season;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;

  Plant copyWith({
    num? id,
    String? uuid,
    String? name,
    String? description,
    String? farmerTime,
    String? images,
    String? season,
    String? createdAt,
    String? updatedAt,
    String? createdBy,
    String? updatedBy,
  }) =>
      Plant(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        description: description ?? this.description,
        farmerTime: farmerTime ?? this.farmerTime,
        image: images ?? this.image,
        season: season ?? this.season,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uuid'] = uuid;
    map['name'] = name;
    map['description'] = description;
    map['farmer_time'] = farmerTime;
    map['images'] = image;
    map['season'] = season;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    return map;
  }
}
