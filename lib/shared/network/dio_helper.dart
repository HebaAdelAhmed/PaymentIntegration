import 'package:dio/dio.dart';

class DioHelper {

  static Dio ? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://accept.paymob.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path ,
    Map<String , dynamic> ? queryParameters,
    // String lang = 'en',
    String ? token,
  }) async{
    dio!.options.headers = {
      // 'lang' : lang,
      'Content-Type' : 'application/json',
      'Authorization' : token,
    };
    return await dio!.get(path , queryParameters: queryParameters );
  }

  static Future<Response> postData ({
    required String path,
    Map<String , dynamic> ? query,
    required Map <String , dynamic> data,
    // String lang = 'en',
    String ? token,
  }) async{
    dio!.options.headers = {
      // 'lang' : lang,
      'Content-Type' : 'application/json',
      'Authorization' : token,
    };
    return await dio!.post(
        path,
        queryParameters: query,
        data: data
    );
  }

  static Future<Response> putData ({
    required String url,
    Map<String , dynamic> ? query,
    required Map <String , dynamic> data,
    String lang = 'en',
    String ? token,
  }) async{
    dio!.options.headers = {
      'lang' : lang,
      'Content-Type' : 'application/json',
      'Authorization' : token,
    };
    return await dio!.put(
        url,
        queryParameters: query,
        data: data
    );
  }

}