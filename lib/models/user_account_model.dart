class RegisterUserModel {
  final String name;
  final String email;
  final String password;
  RegisterUserModel(
      {required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password};
  }
}

class LoginUserModel {
  final String email;
  final String password;
  LoginUserModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
