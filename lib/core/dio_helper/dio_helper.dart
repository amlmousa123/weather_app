import 'package:dio/dio.dart';

class DioHelper {

  static const String _API_KEY = 'aef543fdea53b64c3cc950013e55925e';
  static const String _Base_Url = 'http://api.openweathermap.org/data/2.5/weather?';

  static Dio _dio = Dio()
    ..options.baseUrl = _Base_Url
    ..options.validateStatus = (v) => v! < 500;

  static Future<Response<dynamic>> post(String path, {Map<String,
      dynamic>? formData, dynamic body, Function(int, int)? onSendProgress}) {
    final response = _dio.post(
        path + '&appid=' + _API_KEY, data: formData != null ? formData : body,
        onSendProgress: onSendProgress);
    return response;
  }

  static Future<Response<dynamic>> get(String path) {
    final response = _dio.get(path + '&appid=' + _API_KEY);
    return response;
  }

}