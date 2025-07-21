import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(BaseOptions(baseUrl: "path"));
}
