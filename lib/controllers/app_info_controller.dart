import 'package:flutter_web/bean/app_info.dart';
import 'package:flutter_web/bean/channels_info.dart';
import 'package:get/get.dart';
import '../http/http_repository.dart';
import '../../http/http_url.dart';
import 'package:get_storage/get_storage.dart';

class AppInfoController extends GetxController {
  var isLoading = true.obs;
  var appInfoList = <AppInfo>[].obs;
  var hotInfoList = <AppInfo>[].obs;
  var channelList = <ChannelInfo>[].obs;

  @override
  void onInit() {
    fetchHotAppInfo();
    fetchChannel();
    super.onInit();
  }

  //频道App信息列表
  void fetchAppInfo(String title) async {
    AppInfo appChannel= AppInfo();
    appChannel.channel = title;
    try {
      isLoading(true);
      var response =
          await HttpRepository.getAppList(HttpUrl.channelInfoUrl, appChannel.toJson());
      if (response != null && response.toString().isNotEmpty) {
        AppResponseInfo responseInfo = AppResponseInfo.fromJson(response);
        if (responseInfo.result!) {
          if (responseInfo.dataList!.isNotEmpty) {
            appInfoList.value = responseInfo.dataList!;
          }
        }
      }
    } finally {
      isLoading(false);
    }
  }

  //热门频道信息
  void fetchHotAppInfo() async {
    try {
      isLoading(true);
      var response =
      await HttpRepository.getHotAppList(HttpUrl.hotUrl, {});
      if (response != null && response.toString().isNotEmpty) {
        AppResponseInfo responseInfo = AppResponseInfo.fromJson(response);
        if (responseInfo.result!) {
          if (responseInfo.dataList!.isNotEmpty) {
            hotInfoList.value = responseInfo.dataList!;
          }
        }
      }
    } finally {
      isLoading(false);
    }
  }

  //频道信息
  void fetchChannel() async {
    try {
      isLoading(true);
      var response =
      await HttpRepository.getChannel(HttpUrl.channelUrl, {});
      if (response != null && response.toString().isNotEmpty) {
        ChannelsInfo responseInfo = ChannelsInfo.fromJson(response);
        if (responseInfo.result!) {
          if (responseInfo.dataList!.isNotEmpty) {
            channelList.value = responseInfo.dataList!;
          }
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
