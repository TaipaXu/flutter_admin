import '/models/mock.dart';
import '/network/request.dart';

List<Mock> userApis = [
  // Login
  Mock(
    route: 'tokens',
    method: HTTPMethod.post,
    data: {
      'userID': 'admin',
      'password': '123',
    },
    reply: MockReply(
      statusCode: 200,
      data: {
        'token': 'adminToken',
        'info': {
          'code': 'admin',
          'name': 'Admin',
          'department': 'Admin',
          'permissions': [
            'admin',
          ],
        },
      },
    ),
  ),

  // Login
  Mock(
    route: 'tokens',
    method: HTTPMethod.post,
    data: {
      'userID': 'admin',
      'password': '1234',
    },
    reply: MockReply(
      statusCode: 404,
      data: {
        'msg': 'Incorrect account or password',
      },
    ),
  ),

  // Get user info
  Mock(
    route: 'users/',
    method: HTTPMethod.get,
    reply: MockReply(statusCode: 200, data: {
      'code': 'admin',
      'name': 'Admin',
      'department': 'Admin',
      'permissions': [
        'admin',
      ],
    }),
  ),
];
