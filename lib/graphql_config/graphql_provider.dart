
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

                            // SERVER LINK: https://ejat6bfro7.execute-api.ap-south-1.amazonaws.com/dev/
                            // LOCAL LINK:  https://1c7qsruatc.execute-api.ap-south-1.amazonaws.com/dev/
class GraphqlClass{
  static HttpLink httpLink = HttpLink(uri: "https://backend.evmwheels.com/graphql");
  // static AuthLink authLink = AuthLink(
  //   getToken: () async => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjM4NzcwNDYyLCJleHAiOjE2NDEzNjI0NjJ9.eMCq_swpAAdWCFF9n86yv0FCTIsZXq_VXZkAjR54M4Y',
  // );

  // static Link link=authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client=ValueNotifier<GraphQLClient>(GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink
  ));

  GraphQLClient clientToQuery(){
    return GraphQLClient(
      link: httpLink,
      cache: InMemoryCache(),);
  }
}