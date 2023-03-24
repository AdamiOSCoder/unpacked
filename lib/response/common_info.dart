class CommonInfo {
  bool? result;
  //int? status;
  List? data;
  String? message;
  CommonInfo({this.result,this.data,this.message});

  CommonInfo.fromJson(Map<String,dynamic> json) {
    result = json['result'];
    //status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['result'] = result ?? "";
    //data['status'] = status;
    data['data'] = data;
    data['message'] = message ?? "";
    return data;
  }
}