class SignInModel {
  String? message;
  String? email;
  String? deviceid;
  String? name;

  SignInModel({this.message, this.email, this.deviceid, this.name});

  SignInModel.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["deviceid"] is String) {
      deviceid = json["deviceid"];
    }

    if (json["name"] is String) {
      deviceid = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    data["email"] = email;
    data["deviceid"] = deviceid;
    data["name"] = name;
    return data;
  }
}
