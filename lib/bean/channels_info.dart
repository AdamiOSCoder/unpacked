import 'package:flutter/cupertino.dart';

class ChannelsInfo {
  bool? result;
  List<ChannelInfo>? dataList;

  ChannelsInfo({this.result, this.dataList});

  ChannelsInfo.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      dataList = <ChannelInfo>[];
      json['data'].forEach((v) {
        dataList!.add(ChannelInfo.fromJson(v));
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

class ChannelInfo {
  late int count;
  late String channel;

  ChannelInfo(this.count, this.channel);

  ChannelInfo.fromJson(Map<String, dynamic> json) {
    count = json['count'] ?? "";
    channel = json['channel'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['channel'] = channel;
    return data;
  }
}

class  ColorItem {
  late Color startColor;
  late Color endColor;
  ColorItem(this.startColor, this.endColor);
}