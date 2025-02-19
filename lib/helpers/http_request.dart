import 'package:dio/dio.dart';

class HttpRequest{
  Dio _dio = Dio();
  static HttpRequest? _request;

  HttpRequest._();
  static HttpRequest get instance{
    _request ??= HttpRequest._();
    return _request!;
  }
  Future<Response> get ({required String url, headers})async{
   return await _dio.get(url);
  }
  post(){}
}