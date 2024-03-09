class UserModel {
  final String id;
  final String userName;
  final String email;

  UserModel({required this.id, required this.email, required this.userName});
  UserModel.fromJson(Map<String, dynamic> json)
      : this(id: json['id'], userName: json['userName'], email: json['email']);

  Map<String, dynamic> toJson() =>
      {"id": id, "userName": userName, "email": email};
}
