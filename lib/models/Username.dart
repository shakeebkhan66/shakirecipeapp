class Username {
  Username({
      this.id, 
      this.lastLogin, 
      this.username, 
      this.email, 
      this.fullname, 
      this.password, 
      this.confirmPassword, 
      this.isStaff, 
      this.isActive, 
      this.isAdmin, 
      this.isSuperuser,});

  Username.fromJson(dynamic json) {
    id = json['id'];
    lastLogin = json['last_login'];
    username = json['username'];
    email = json['email'];
    fullname = json['fullname'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    isAdmin = json['is_admin'];
    isSuperuser = json['is_superuser'];
  }
  int? id;
  String? lastLogin;
  String? username;
  String? email;
  String? fullname;
  String? password;
  String? confirmPassword;
  bool? isStaff;
  bool? isActive;
  bool? isAdmin;
  bool? isSuperuser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['last_login'] = lastLogin;
    map['username'] = username;
    map['email'] = email;
    map['fullname'] = fullname;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['is_staff'] = isStaff;
    map['is_active'] = isActive;
    map['is_admin'] = isAdmin;
    map['is_superuser'] = isSuperuser;
    return map;
  }

}