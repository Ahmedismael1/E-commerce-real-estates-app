
import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://berry.parfaih.com/api/v1/',
        receiveDataWhenStatusError: true,

      ),
    );
  }

  static Future<Response> getData({
 String url,
    String token,

  }) async
  {
    dio.options.headers={
      'Accept-Language':'en',
      'Accept-Encoding':'application/json',
      'Accept':'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization':'Bearer ${token}'??''

    };

    return await dio.get(
      url,

    );
  }

  static Future<Response> postData({
   String url,
   String token,
   Map<String, dynamic> data,
    Map<String, dynamic> query,

  })
  async
  {
    dio.options.headers={
      'Accept-Language':'en',
      'Accept-Encoding':'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization':token??''



    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }}