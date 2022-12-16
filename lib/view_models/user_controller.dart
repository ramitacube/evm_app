import 'dart:async';
import 'dart:convert';

import 'package:car_rental/graphql_config/graphql_provider.dart';
import 'package:car_rental/models/customer_model.dart';
import 'package:car_rental/queryMutation/mutation_class.dart';
import 'package:car_rental/view_models/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserController extends BaseController {
  String loginType = 'login';
  bool isLoading = false;
  Timer timer;
  String responses;
  String registerData;
  String phoneNo;

  String otp;
  String userName;
  String password;
  String phone;
  final pinPutController = TextEditingController();

  GraphqlClass graphqlClass = new GraphqlClass();

  CustomerData customerData = CustomerData();

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future getUser() async {
    setLoading();
    customerData = await sharedPreferenceHelper.getUser();
    if (customerData != null) {
      print(
          "User Name / ID ==${customerData.login.user.name} / ${customerData.login.user.id} \n ${customerData.login.accessToken}");
    } else {
      setError();
    }
  }

  changeLoginType() {
    if (loginType == 'login') {
      loginType = 'OTP';
    } else {
      loginType = 'login';
    }
    update();
  }

  Future<bool> isLoggedIn() async {
    if (customerData?.login == null) {
      customerData = await sharedPreferenceHelper.getUser();
      if (customerData != null) {
        print(
            "User Name / ID ==${customerData.login.user.name} / ${customerData.login.user.id} \n ${customerData.login.accessToken}");
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  Future<bool> register(
    String name,
    String email,
    String password,
    String phone,
    String address,
    String dob,
    String gender,
  ) async {
    isLoading = true;
    phoneNo = phone;
    GraphQLClient client = graphqlClass.clientToQuery();

    try {
      QueryResult result = await client.mutate(MutationOptions(
          documentNode: gql(MutationClass().register),
          variables: {
            "input": {
              "name": name,
              "email": email,
              "password": password,
              "phone": phone,
              "address": address,
              "dob": dob,
              "gender": gender,
            }
          }));
      if (result.data != null) {
        String responseDetails = getPrettyJSONString(result.data);
        var response = json.decode(responseDetails);
        print(response['customerRegister']['tokens']['user']['otp']);
        registerData = response['customerRegister']['tokens']['user']['otp'];
        return true;
      } else {
        return false;
      }
    } on NetworkException catch (e) {
      setError();
      showToast("User Already Exist...!");
      return false;
    } on Error {
      setError();
      showToast("User Already Exist...!");
    }
  }

  Future<bool> verifyOtp(String phone, String otp) async {
    isLoading = true;
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.mutate(MutationOptions(
          documentNode: gql(MutationClass().otpVerification),
          variables: {
            "input": {"otp": otp, "phone": phone}
          }));

      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      // if(responses['VerifyOTP']=="Verification Success!"){
      //
      //   isLoading=false;
      //   return true;
      // }

      return true;
    } on NetworkException catch (e) {
      return false;
      print(e);
    }
  }

  Future<bool> logIn({String userMail, String password}) async {
    isLoading = true;
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.mutate(
          MutationOptions(documentNode: gql(MutationClass().logIn), variables: {
        "input": {
          'username': userMail, //ananthu123@gmail.com,
          'password': password //12345678
        }
      }));

      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data?.login);
      var response = json.decode(responseDetails);
      // customerData = CustomerData.fromJson(response);
      sharedPreferenceHelper
          .saveUser(jsonEncode(CustomerData.fromJson(response)));
      //print("User Name / ID ==${customerData.login.user.name} / ${customerData.login.user.id} \n ${customerData.login.accessToken}");
      isLoading = false;
      return true;
    } on NetworkException catch (e) {
      print(e);
      return false;
    }
  }
  Future<bool> sendOtp({String phone, String type}) async {
    isLoading = true;
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.mutate(MutationOptions(
          documentNode: gql(MutationClass().otpSend),
          variables: {
            "input": {"username": phone, "type": type}
          }));

      print("Data===${result.data}");
      String responseDetails = getPrettyJSONString(result.data);
      var response = json.decode(responseDetails);
      // if(responses['VerifyOTP']=="Verification Success!"){
      //
      //   isLoading=false;
      //   return true;
      // }

      return true;
    } on NetworkException catch (e) {
      return false;
      print(e);
    }
  }
  Future<bool> logInOtp({String userMail, int otp}) async {
    isLoading = true;
    GraphQLClient client = graphqlClass.clientToQuery();
    try {
      QueryResult result = await client.mutate(
          MutationOptions(documentNode: gql(MutationClass().loginOtp), variables: {
            "input": {
              'username': userMail, //ananthu123@gmail.com,
              'otp': password //12345678
            }
          }));

      print("Data===${result.data["otp``"]}");
      String responseDetails = getPrettyJSONString(result.data.loginOtp);
      var response = json.decode(responseDetails);
      // customerData = CustomerData.fromJson(response);
      sharedPreferenceHelper
          .saveUser(jsonEncode(CustomerData.fromJson(response)));
      //print("User Name / ID ==${customerData.login.user.name} / ${customerData.login.user.id} \n ${customerData.login.accessToken}");
      isLoading = false;
      return true;
    } on NetworkException catch (e) {
      print(e);
      return false;
    }
  }
  logout() {
    customerData = null;
    sharedPreferenceHelper.removeAll();
  }

  static String getPrettyJSONString(Object jsonObject) {
    String response = JsonEncoder.withIndent(' ').convert(jsonObject);
    return response;
  }
}
