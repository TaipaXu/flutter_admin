import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'modules/user.dart' as mock;
import '/network/request.dart';

DioAdapter getAdapter(BaseOptions options) {
  RequestMethods method;
  final dio = Dio(BaseOptions());
  final adapter = DioAdapter(dio: dio);
  for (var item in mock.userApis) {
    switch (item.method) {
      case HTTPMethod.get:
        method = RequestMethods.get;
        break;
      case HTTPMethod.put:
        method = RequestMethods.put;
        break;
      case HTTPMethod.post:
        method = RequestMethods.post;
        break;
      case HTTPMethod.patch:
        method = RequestMethods.patch;
        break;
      case HTTPMethod.update:
        // TODO
        method = RequestMethods.patch;
        break;
      case HTTPMethod.delete:
        method = RequestMethods.delete;
        break;
    }
    adapter.onRoute(
      item.route,
      (request) => request.reply(item.reply.statusCode, item.reply.data),
      request: Request(
        route: item.route,
        method: method,
        data: item.data,
        queryParameters: item.queryParameters,
        // headers: options.headers,
      ),
    );
  }

  return adapter;
}
