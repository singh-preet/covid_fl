import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {
final Dio _previousDio;

  ApiInterceptor(this._previousDio){
Dio newDio =Dio(_previousDio.options);
newDio.interceptors.add(_previousDio.interceptors.first);
  }

@override
void onRequest(RequestOptions options, RequestInterceptorHandler handler)   {
  return super.onRequest(options, handler);
}

@override
void onResponse(Response response, ResponseInterceptorHandler handler) {
  return super.onResponse(response, handler);
}

@override
void onError(DioError err, ErrorInterceptorHandler handler) async {
  return super.onError(err, handler);
}

}