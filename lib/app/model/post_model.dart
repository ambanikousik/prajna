

import 'package:meta/meta.dart';


class PostModel {
  PostModel({
    @required this.id,
    @required this.description,
    @required this.title,
    @required this.photo,
  });

  final String id;
  final String description;
  final String title;
  final String photo;

  PostModel copyWith({
    String id,
    String description,
    String title,
    String photo,
  }) =>
      PostModel(
        id: id ?? this.id,
        description: description ?? this.description,
        title: title ?? this.title,
        photo: photo ?? this.photo,
      );

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    description: json["description"],
    title: json["title"],
    photo: json["photo"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "description": description,
    "title": title,
    "photo": photo,
  };
}
