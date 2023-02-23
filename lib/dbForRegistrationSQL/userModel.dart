class User {
  int id;
  String login;
  int password;

  User({
    required this.id,
    required this.login,
    required this.password});

  User.fromMap(Map<String, dynamic> user):
        id=user["id"], login= user["login"], password=user['password'];

  Map<String, Object> toMap() {
    return {'id':id, 'login': login, 'password': password};
  }

}