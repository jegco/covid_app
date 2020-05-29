import 'package:dio/dio.dart';

class ClientConf {

  Dio client;

  ClientConf() : client = Dio(BaseOptions(
    baseUrl: "https://api.covid19api.com/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

}