
import 'dart:convert';

import 'package:car_rental/graphql_config/graphql_provider.dart';
import 'package:car_rental/models/head_model.dart';
import 'package:car_rental/queryMutation/query_class.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FilterController extends GetxController{

  bool seat5=false;
  bool seat7=false;
  bool ac=false;
  bool music=false;
  bool abs=false;
  bool gps=false;
  bool automatic=false;
  bool manual=false;
  bool petrol=false;
  bool desel=false;

  bool isLoading=false;
  GraphqlClass graphqlClass=GraphqlClass();
  //HeadData headData=HeadData();
  List<ProductAttrHeadWithValue> headData=[];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  Future <void> getHeadValue() async {
    isLoading=true;
    update();
    GraphQLClient client = graphqlClass.clientToQuery();
    try{
      QueryResult result = await client.query(
        QueryOptions(documentNode: gql(QueryClass().getHeader),),);
      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      headData = HeadData.fromJson(response).productAttrHeadWithValue;
      print("result length==${headData.length}");
      isLoading=false;
      update();
    } on NetworkException catch (e){
      print(e);
    }
  }

  static String getPrettyJSONString(Object jsonObject) {
    String response = JsonEncoder.withIndent(' ').convert(jsonObject);
    return response;
  }

}