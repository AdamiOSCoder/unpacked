import 'package:dio/dio.dart';

import 'http_url.dart';
class HttpUtil {
  static HttpUtil? instance;
  final Dio _dio = Dio();
  BaseOptions? _options;

  static HttpUtil? getInstance() {
    instance ??= HttpUtil();
    return instance;
  }

  HttpUtil() {
    _options = BaseOptions(
      connectTimeout: const Duration(seconds: 2000),
      receiveTimeout: const Duration(seconds: 2000),
      responseType: ResponseType.json,
    );

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      //SharedPreferences preferences = await SharedPreferences.getInstance();
      //var token = preferences.getString("token");
      options.headers.addAll({
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'X-api-token': token
      });
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      return handler.next(e); //continue
    }));
  }

  Future register(url, param) async {
    Response? response;
    try {
      String host = HttpUrl.host;
      //queryParameters 和data的区别，用前者会报400错误

      response = await _dio.post('$host$url', data: param);
    } on DioError catch (e) {
      formatError(e);
    }
    if (response == null) {
      return null;
    }
    return response.data;
  }

  Future login(url, param) async {
    Response? response;
    try {
      String host = HttpUrl.host;
      //queryParameters 和data的区别，用前者会报400错误
      response = await _dio.post('$host$url', data: param);
    } on DioError catch (e) {
      formatError(e);
    }
    if (response == null) {
      return null;
    }
    return response.data;
  }

  Future update(url, param) async {
    Response? response;
    try {
      String host = HttpUrl.host;
      //queryParameters 和data的区别，用前者会报400错误
      response = await _dio.put('$host$url', data: param);
    } on DioError catch (e) {
      formatError(e);
    }
    if (response == null) {
      return null;
    }
    return response.data;
  }

  Future getChannelInfo(url, param) async {
    Response? response;
    try {
      String host = HttpUrl.host;
      //queryParameters 和data的区别，用前者会报400错误
      response = await _dio.get('$host$url', queryParameters: param);
    } on DioError catch (e) {
      formatError(e);
    }
    if (response == null) {
      return null;
    }
    return response.data;

  }

  Future getAppList(url, param) async {
    Response? response;
    try {
      String host = HttpUrl.host;
      //queryParameters 和data的区别，用前者会报400错误
      response = await _dio.post('$host$url', data: param);

    } on DioError catch (e) {
      formatError(e);
    }
    if (response == null) {
      return null;
    }
    // print("bbbbbb---${response.data}");
    return response.data;
  }

  Future getHotAppList(url, param) async {
    Response? response;
    try {
      String host = HttpUrl.host;
      //queryParameters 和data的区别，用前者会报400错误
      response = await _dio.get('$host$url', queryParameters: param);

    } on DioError catch (e) {
       print("ccccc---${e}");
      formatError(e);
    }
    if (response == null) {
      return null;
    }
    //print("aaaaa---${response.data}");
    return response.data;
  }


  Future getChannel(url, param) async {
    Response? response;
    try {
      String host = HttpUrl.host;
      //queryParameters 和data的区别，用前者会报400错误
      response = await _dio.get('$host$url', queryParameters: param);

    } on DioError catch (e) {
      // print("ccccc---${e}");
      formatError(e);
    }
    if (response == null) {
      return null;
    }
    //print("nnnnn---${response.data}");
    return response.data;
  }

  void formatError(DioError e) {
    if (e.type == DioErrorType.connectionTimeout) {
      // print("timeout");
    } else if (e.type == DioErrorType.sendTimeout) {
      //  print("timeout");
    } else if (e.type == DioErrorType.receiveTimeout) {
      // print("timeout");
    } else if (e.type == DioErrorType.badResponse) {
      // print("error 404 503");
    } else if (e.type == DioErrorType.cancel) {
      //print("request cancel");
    } else {
      // print("unknown");
    }
  }

  Future get(url, param, {options}) async {
    Response? response;
    try {
      String host = HttpUrl.host;
      response =
      await _dio.get('$host$url', queryParameters: param, options: options);
    } on DioError catch (e) {
      formatError(e);
    }
    if (response == null) {
      return null;
    }
    //return response.data;
    return response;
  }

  Future post(url, param, {options}) async {
    Response? response;
    try {
      String host = HttpUrl.host;
      response = await _dio.post(
        '$host$url',
        queryParameters: param,
        options: options,
      );
    } on DioError catch (e) {
      formatError(e);
    }
    if (response == null) {
      return null;
    }
    return response.data;
  }
}
