import 'package:meta/meta.dart';

import 'package:prajna/common/data/data.dart';

class UserModel {
  UserModel({
    @required this.dob,
    @required this.id,
    @required this.photo,
    @required this.username,
  });

  final DateTime dob;
  final String id;
  final String photo;
  final String username;

  UserModel copyWith({
    int dob,
    String id,
    String photo,
    String username,
  }) =>
      UserModel(
        dob: dob ?? this.dob,
        id: id ?? this.id,
        photo: photo ?? this.photo,
        username: username ?? this.username,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        dob: CommonDateHandler.toDate(timestamp: json["dob"]),
        id: json["id"],
        photo: json["photo"],
        username: json["username"],
      );

  static String queryString({@required String userID}) => """
  query getUser {
  user_by_pk(id: "$userID") {
    dob
    id
    photo
  }
}""";
}
