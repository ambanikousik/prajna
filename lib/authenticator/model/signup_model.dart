part of 'models.dart';
class SignUpModel extends Equatable{
  final String email;
  final String userName;
  final DateTime dateOfBirth;
  final String password;
  SignUpModel({
    @required this.email,
    @required this.userName,
    @required this.dateOfBirth,
    @required this.password})
      :assert(email != null),
        assert(userName != null),
        assert(dateOfBirth != null),
        assert(password != null);

  Map<String, dynamic> toMap() => {
    "username": userName,
    "dob": CommonDateHandler.toTimeStamp(dateTime: dateOfBirth),
  };


 final String mutationString = """
  mutation newUser(\$dob: Int!, \$username: String!) {
  insert_user_one(object: {dob: \$dob, username: \$username}) {
    id
  }
}
  """;

  @override
  List<Object> get props => [email,dateOfBirth,userName,password];
}