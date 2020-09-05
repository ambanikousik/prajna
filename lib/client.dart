import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink _httpLink = HttpLink(
  uri: 'https://electric-kodiak-11.hasura.app/v1/graphql',
);


ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: _httpLink,
  ),
);