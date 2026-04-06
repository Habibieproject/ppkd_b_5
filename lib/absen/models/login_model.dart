class LoginModel {
  String? message;
  LoginData? data;

  LoginModel({this.message, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json["message"],
      data: json["data"] != null ? LoginData.fromJson(json["data"]) : null,
    );
  }
}

class LoginData {
  String? token;

  LoginData({this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(token: json["token"]);
  }
}
