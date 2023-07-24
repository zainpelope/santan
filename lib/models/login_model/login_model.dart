class LoginModel {
  LoginModel({
    this.token,
    this.user,
  });

  LoginModel.fromJson(dynamic json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  String? token;
  User? user;

  LoginModel copyWith({
    String? token,
    User? user,
  }) =>
      LoginModel(
        token: token ?? this.token,
        user: user ?? this.user,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    this.username,
    this.email,
    this.name,
    this.uuid,
  });

  User.fromJson(dynamic json) {
    username = json['username'];
    email = json['email'];
    name = json['name'];
    uuid = json['uuid'];
  }

  String? username;
  String? email;
  String? name;
  String? uuid;

  User copyWith({
    String? username,
    String? email,
    String? name,
    String? uuid,
  }) =>
      User(
        username: username ?? this.username,
        email: email ?? this.email,
        name: name ?? this.name,
        uuid: uuid ?? this.uuid,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['email'] = email;
    map['name'] = name;
    map['uuid'] = uuid;
    return map;
  }
}
