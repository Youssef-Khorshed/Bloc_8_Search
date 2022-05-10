import 'package:dio/dio.dart';

class DioHelper {
  // Dio
  static Dio? dio;
  // intial
  static void intial() {
    dio = Dio(BaseOptions(
        //base url
        baseUrl: 'https://sae-marketing.com/NOON/api/',
        receiveDataWhenStatusError: true));
  }

  //post
  static Future<Response> post(
      {required String path, required dynamic query}) async {
    return await dio!.post(path, queryParameters: query);
  }

  //get
  static Future<Response> getdata({required String path}) async {
    return await dio!.get(path);
  }

  //update
  static Future<Response> update(
      {required String path, required dynamic query}) async {
    return await dio!.put(path, queryParameters: query);
  }

  //delete
  static Future<Response> delete(
      {required String path, required dynamic query}) async {
    return await dio!.delete(path, queryParameters: query);
  }
}
