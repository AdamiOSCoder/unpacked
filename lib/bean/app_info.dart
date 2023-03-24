class AppResponseInfo {
  bool? result;
  List<AppInfo>? dataList;

  AppResponseInfo({this.result, this.dataList});

  AppResponseInfo.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      dataList = <AppInfo>[];
      json['data'].forEach((v) {
        dataList!.add(AppInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (dataList != null) {
      data["dataList"] = dataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppInfo {
  int? id;
  String? name;
  String? version;
  String? size;
  String? channel;
  String? popularity;
  String? packed;
  int? hot;

  AppInfo({this.id, this.name, this.version, this.size, this.channel,
      this.popularity, this.packed,this.hot});

  AppInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    version = json['version'];
    size = json['size'];
    channel = json['channel'];
    popularity = json['popularity'];
    packed = json['packed'];
    hot = json['hot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? "";
    data['name'] = name ?? "";
    data['version'] = version ?? "";
    data['size'] = size ?? "";
    data['channel'] = channel ?? "";
    data['popularity'] = popularity ?? "";
    data['packed'] = packed ?? "";
    data['hot'] = hot ?? "";
    return data;
  }
}
