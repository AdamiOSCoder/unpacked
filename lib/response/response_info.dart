import 'common_info.dart';

class ResponseInfo {
  String? userName;
  String? password;
  CommonInfo? commonInfo;
  int? type;
  int? account;

  ResponseInfo(
      {this.commonInfo,
        this.type,
        this.account,
        this.userName,
        this.password
       });

  ResponseInfo.fromJson(Map<String,dynamic> json) {
    commonInfo = CommonInfo();
    commonInfo!.result = json['result'];
    commonInfo!.message = json['message'];
    commonInfo!.data = json['data'];
    type = json['type'];
    account = json['account'];
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['result'] = commonInfo!.result ?? "";
    data['message'] = commonInfo!.message ?? "";
    data['data'] = commonInfo!.data ?? "";
    data['userName'] = userName ?? "";
    data['password'] = password ?? "";
    //data['status'] = commonInfo!.status;
    data['type'] = type ?? "";
    data['account'] = account ?? "";
    return data;
  }
}