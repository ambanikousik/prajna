part of 'models.dart';

class LoginModel{
  String email;
  String password;
  LoginModel({@required this.email,@required this.password})
      :assert(email != null),assert(password != null);
}