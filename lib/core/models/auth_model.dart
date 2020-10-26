class AuthModel {
  final String email,password,fullname,avatar;

  AuthModel({this.email, this.password, this.fullname, this.avatar});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      password: json['password'],
      fullname: json['fullname'],
      avatar: json['avatar'],
    );
  }
}
