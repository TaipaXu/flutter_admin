import 'package:dio/dio.dart';
import 'package:x_message/x_message.dart' as x;
import '/config.dart' as config;
import '/storages/token.dart' as storage;
import '/router/navigatorKey.dart' as global;
import '/mocks/adapter.dart' as mock;

enum HTTPMethod {
  get,
  put,
  post,
  patch,
  update,
  delete,
}

String _getMehodStr(HTTPMethod method) {
  switch (method) {
    case HTTPMethod.get:
      return 'GET';
    case HTTPMethod.put:
      return 'PUT';
    case HTTPMethod.post:
      return 'POST';
    case HTTPMethod.patch:
      return 'PATCH';
    case HTTPMethod.update:
      return 'UPDATE';
    case HTTPMethod.delete:
      return 'DELETE';
  }
}

Future<dynamic> request({
  required String url,
  required HTTPMethod method,
  Map<String, dynamic>? params,
  dynamic data,
}) async {
  BaseOptions options = BaseOptions(
    baseUrl: config.baseApi,
    method: _getMehodStr(method),
    connectTimeout: 5000,
    receiveTimeout: 5000,
    followRedirects: true,
  );

  String? token = await storage.Token.getToken();
  if (token != null) {
    options.headers['token'] = token;
  }

  final Dio dio = Dio(options);
  if (config.mock) {
    dio.httpClientAdapter = mock.getAdapter(options);
  }

  dio.interceptors.add(InterceptorsWrapper(
    // onResponse: (Response response, ResponseInterceptorHandler handler) {
    //   return handler.next(response);
    // },
    onError: (DioError error, ErrorInterceptorHandler handler) {
      final dynamic response = error.response;
      if (response != null) {
        final dynamic msg = response.data['msg'];
        x.Message(
          context: global.getMainContext(),
          message: msg,
        );

        throw (error.response?.data.message);
      }
    },
  ));

  final response = await dio.request(
    url,
    queryParameters: params,
    data: data,
  );
  return response.data;
}
