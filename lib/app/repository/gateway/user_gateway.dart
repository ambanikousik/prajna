import 'package:graphql_flutter/graphql_flutter.dart';
import '../../model/models.dart';
import 'package:meta/meta.dart';
import '../../../client.dart';

class UserGateway {
  final GraphQLClient _client = client.value;

  Future<UserModel> getUser({@required String userID}) async {
    final results = await _client.query(QueryOptions(
      documentNode: gql(
        UserModel.queryString(userID: userID),
      ),
    ));
    if (results.data != null) {
      print(results.data['user_by_pk']);
      return UserModel.fromMap(results.data['user_by_pk']);
    }
    if (results.hasException) {
      print(results.exception.toString());
    }
  }

  Future<List<String>> getDailyPsychology() async {
    String _queryString = """
   query getDailyPsychology {
  cards {
    link
  }
}
""";
    List<String> _links = [];
    final results = await _client.query(QueryOptions(
      documentNode: gql(_queryString),
    ));
    if (results.data['cards'] != null) {
      results.data['cards'].forEach((link) {
        _links.add(link['link']);
      });
    }
    if (results.hasException) {
      print(results.exception.toString());
    }

    return _links;
  }

  Future<List<PostModel>> getPosts() async {
    String _queryString = """
query getPosts {
  post {
    id
    description
    title
    photo
  }
}
""";
    List<PostModel> _posts = [];
    final results = await _client.query(QueryOptions(
      documentNode: gql(_queryString),
    ));
    print("post");
    print(results.data);
    if (results.data['post'] != null) {
      results.data['post'].forEach((post) {
        _posts.add(PostModel.fromMap(post));
      });
    }
    if (results.hasException) {
      print(results.exception.toString());
    }

    return _posts;
  }


}
