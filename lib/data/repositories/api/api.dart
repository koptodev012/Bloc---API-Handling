import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  // Initilization
  Dio dio = Dio();

// constructor
  API() {
    dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    dio.interceptors.add(PrettyDioLogger());
  }

// getter
  Dio get sendRequest => dio;
}
