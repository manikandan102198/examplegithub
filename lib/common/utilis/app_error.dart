import 'dart:io';

import 'package:dio/dio.dart';
import 'package:example_app_github/common/utilis/app_exception.dart';

import 'message_constant.dart';

class AppError {
  AppException exception(DioError e) {
    if (e.error is SocketException) {
      return AppException(
          errorMsg: MessageConstant.noInternet, statusCode: '1');
    } else if (e.type == DioErrorType.response) {
      return _errorCode(e.response?.statusCode);
    }
    return AppException(
        errorMsg: MessageConstant.databaseIssue, statusCode: '0');
  }

  AppException _errorCode(int? code) {
    switch (code) {
      case 401:
        return AppException(
            errorMsg: MessageConstant.authFailed, statusCode: code.toString());
      case 403:
        return AppException(
            errorMsg: MessageConstant.forbidden, statusCode: code.toString());
      default:
        return AppException(
            errorMsg: MessageConstant.noData, statusCode: code.toString());
    }
  }

}
