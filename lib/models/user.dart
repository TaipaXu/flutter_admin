class User {
  String code;
  String name;
  List<String>? permissions;

  User({required this.code, required this.name, this.permissions});

  User.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        name = json['name'],
        permissions = json['permissions'];

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'permissions': permissions,
      };
}
