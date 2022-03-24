import '/network/request.dart';

class MockReply {
  int statusCode;
  dynamic data;

  MockReply({required this.statusCode, required this.data});
}

class Mock {
  final String route;
  final HTTPMethod method;
  final Map<String, dynamic>? queryParameters;
  final dynamic data;
  final MockReply reply;

  Mock(
      {required this.route,
      required this.method,
      this.queryParameters,
      this.data,
      required this.reply});
}
