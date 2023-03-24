class UserInfo {
  String? username;
  String? password;
  String? secondPassword;
  UserInfo({this.username, this.password,this.secondPassword});

  UserInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    secondPassword = json['secondPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username ?? "";
    data['password'] = password ?? "";
    data['secondPassword'] = secondPassword ?? "";
    return data;
  }
}
