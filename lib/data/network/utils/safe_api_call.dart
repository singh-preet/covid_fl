import 'package:dartz/dartz.dart';
import 'package:retrofit/retrofit.dart';
import 'package:phone_tech_london/data/network/utils/network_error.dart';
import 'package:phone_tech_london/utils/app_constant.dart';
import 'dart:io';
import 'package:dio/dio.dart';

Future<Either<NetworkError, T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;

    if (!eitherResponse.isSuccessful()) {
      return Left(
        NetworkError(
          errorMsg: eitherResponse.response.statusMessage,
          errorCode: eitherResponse.response.statusCode,
        ),
      );
    } else {
      return Right(originalResponse);
    }
  } catch (throwable) {
    switch (throwable.runtimeType) {
      case DioError:
        switch ((throwable as DioError).type) {
          case DioErrorType.connectTimeout:
            Left(
              NetworkError(
                  errorMsg: AppConstant.connectionTimeout,
                  errorCode: throwable.response?.statusCode),
            );
            break;
          case DioErrorType.sendTimeout:
            Left(
              NetworkError(
                  errorMsg: AppConstant.sendTimeout,
                  errorCode: throwable.response!.statusCode),
            );
            break;
          case DioErrorType.receiveTimeout:
            Left(
              NetworkError(
                  errorMsg: AppConstant.receiveTimeout,
                  errorCode: throwable.response!.statusCode),
            );
            break;
          case DioErrorType.response:
            if (throwable is DioError) {
              late String message;
              switch (throwable.response!.statusCode) {
                case 400:
                  message = AppConstant.badRequest;
                  break;
                case 401:
                  // message = 'Unauthorized';
                  message = AppConstant.unauthorized;
                  break;
                case 403:
                  //message = 'Forbidden';
                  message = AppConstant.unauthorized;
                  break;
                case 404:
                  message = AppConstant.notFound;
                  break;
                case 415:
                  message = AppConstant.unsupportedMedia;
                  break;
                case 500:
                  message = AppConstant.internalServer;
                  break;
              }
              return Left(
                NetworkError(
                    errorMsg: message,
                    errorCode: throwable.response!.statusCode),
              );
            }
            break;
          //"Received invalid status code: ${error.response.statusCode}";
          case DioErrorType.cancel:
            //"Request to API server was cancelled"
            break;
          case DioErrorType.other:
            return Left(
              NetworkError(
                errorMsg: AppConstant.errorNoInternet,
                errorCode: 503,
              ),
            );
        }
        break;

      case IOException:
        return Left(
          NetworkError(
            errorMsg: throwable.toString(),
            errorCode: 502,
          ),
        );

      case HttpException:
        // var code = throwable.code();
        return Left(
          NetworkError(
            errorMsg: (throwable as HttpException).message,
            errorCode: 500,
          ),
        );

      default:
        return Left(
          NetworkError(errorMsg: throwable.toString(), errorCode: 502),
        );
    }
    rethrow;
  }
}

extension RetrofitResponse on HttpResponse {
  bool isSuccessful() {
    return response.statusCode == 200;
  }
}
