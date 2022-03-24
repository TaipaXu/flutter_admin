import '/network/request.dart';

Future<dynamic> login({
  required String account,
  required String password,
}) async {
  return request(
    url: 'tokens',
    method: HTTPMethod.post,
    data: {
      'userID': account,
      'password': password,
    },
  );
}

Future<dynamic> getInfo() async {
  return request(
    url: 'users/',
    method: HTTPMethod.get,
  );
}
