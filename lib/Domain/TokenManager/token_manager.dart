import 'package:hospital/Domain/Profile/profile_service.dart';

class TokenManager {
  TokenManager._internal();
  static TokenManager instance = TokenManager._internal();
  factory TokenManager() => instance;

  String? _email;
  String? _password;
  String? _name;
  ProfileModel? _model;

  String? get email => _email;
  String? get password => _password;
  ProfileModel? get model => _model;
  String? get name => _name;

  setEmail(String email) {
    _email = email;
  }

  setPassword(String password) {
    _password = password;
  }

  setModel(ProfileModel profileModel) {
    _model = profileModel;
  }

  setName(String name) {
    _name = name;
  }
}
