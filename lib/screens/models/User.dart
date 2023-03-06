class User {
  User({
      this.id, 
      this.username, 
      this.email, 
      this.fullname,});

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    fullname = json['fullname'];
  }
  int? id;
  String? username;
  String? email;
  String? fullname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['fullname'] = fullname;
    return map;
  }

}