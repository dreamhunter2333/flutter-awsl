
import 'package:dio/dio.dart';
import 'package:awsl/services/network/requests/base_request.dart';

class NetworkManager{


  //region Singleton
  static final NetworkManager _shared = NetworkManager._internal();
  static NetworkManager get shared => _shared;
  //endregion

  //region Constructors
  NetworkManager._internal();
  //endregion

  final String domain = 'http://awsl-py.dev.jcstaff.club/';

  Map<String, dynamic> get headers{
    return {};
  }

  Future<Map<String, dynamic>> request(BaseRequest request, String method) async{

    BaseOptions baseOptions = BaseOptions();
    baseOptions.baseUrl = domain;
    baseOptions.headers = headers;
    baseOptions.method = method;

    Dio dio = Dio(baseOptions);
    dio.interceptors.add(LogInterceptor(responseBody:false));

    return dio.request(request.api, queryParameters: request.toJson()).then((response) {

      dynamic json = response.data;
      if(response.statusCode == 200 || response.statusCode == 201){

        if(json is! Map){
          json = {'results' : json };
        }

        return json as Map<String, dynamic>;
      }

      return {};
    }, onError: (error){
      return {};
    });
  }
}