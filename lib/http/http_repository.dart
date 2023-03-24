
import '../bean/app_info.dart';
import 'http_util.dart';

class HttpRepository {

  //POST 注册
  static Future register(String url,Map<String,dynamic> param) async {
    var  response = await HttpUtil.getInstance()!.register(url, param);
    return response;
  }

  //POST 登录
  static Future login(String url,Map<String,dynamic> param) async {
    var  response = await HttpUtil.getInstance()!.login(url, param);
    return response;
  }

  //put 更新密码
  static Future update(String url,Map<String,dynamic> param) async {
    var  response = await HttpUtil.getInstance()!.update(url, param);
    return response;
  }

  //GET 获取栏目信息
  static Future getChannelInfo(String url,Map<String,dynamic> param) async {
    var  response = await HttpUtil.getInstance()!.getChannelInfo(url, param);
    return response;
  }

  //GET 获取App列表信息
  static Future getAppList(String url,Map<String,dynamic> param) async {
    var  response = await HttpUtil.getInstance()!.getAppList(url, param);
    return response;
  }

  //GET 获取热门App列表信息
  static Future getHotAppList(String url,Map<String,dynamic> param) async {
    var  response = await HttpUtil.getInstance()!.getHotAppList(url, param);
    return response;
  }

  //GET 获取频道channel信息
  static Future getChannel(String url,Map<String,dynamic> param) async {
    var  response = await HttpUtil.getInstance()!.getChannel(url, param);
    return response;
  }
}