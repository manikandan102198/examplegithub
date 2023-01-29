import 'package:dio/dio.dart';

import 'app_constant.dart';

class ApiClient {
  final _dio = Dio();

  Future get(String path, String token, {Map<dynamic, dynamic>? params}) async {
    final response = await _dio.get(_getPath(path, params),
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(response);
    }
  }

  String _getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params != null && params.isNotEmpty) {
      params.forEach((key, value) {
        if (value != '') {
          paramsString += '$key=$value&';
        }
      });
    }
    return '${AppConstant.baseUrl}$path?$paramsString';
  }
}
