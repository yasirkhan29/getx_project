import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/login/login_page.dart';
import 'package:getx_project/model/custom_webservices.dart';
import 'package:http/http.dart' as http;

class Signupcontroller extends GetxController {
  var isprofilepocpathset = false.obs;
  var profilepicpath = "".obs;
  var profileImageBase64;

  String userName = "";
  String userEmail = "";
  String userMobile = "";
  String userPass = "";
  String userGender = "";

  void setprofileImagePath(String path) {
    profilepicpath.value = path;
    isprofilepocpathset.value = true;
  }

  void signUpUser(String name, String email, String mobile, String pass,
      String rePass, String gender) {
    if (isprofilepocpathset.value == false) {
      Get.snackbar("Sign up Faild", "Please Captuer/Select profile pictuer",
          backgroundColor: Colors.purple, snackPosition: SnackPosition.BOTTOM);
    } else if (pass != rePass) {
      Get.snackbar("Sign up Faild", "Password does not match",
          backgroundColor: Colors.purple, snackPosition: SnackPosition.BOTTOM);
    } else if (!isEmailValid(email)) {
      Get.snackbar("Sign up Faild", "Email ID is not valid",
          backgroundColor: Colors.purple, snackPosition: SnackPosition.BOTTOM);
    } else {
      userName = userName;
      userEmail = userEmail;
      userMobile = userMobile;
      userPass = userPass;
      userGender = userGender;
      sendUserDataToServer();
    }
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  Future<void> sendUserDataToServer() async {
    Map<String, dynamic> dataBody = {
      CustomWebServices.PROFILE_IMAGE: profileImageBase64,
      CustomWebServices.USER_NAME: userName,
      CustomWebServices.USER_EMAIL: userEmail,
      CustomWebServices.USER_MOBILE: userMobile,
      CustomWebServices.USER_PASS: userPass,
      CustomWebServices.USER_GENDER: userGender,
    };

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.signup_api_url),
        body: dataToSend);

    // print(response);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData['r_msg'] == "success") {
        Get.to(LoginPage());
      } else if (responseData['r_msg'] == "failed") {
        Get.snackbar(
          "Sign Up Failed",
          "Server Problem Occured",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      } else if (responseData['r_msg'] == "mobile number already exist") {
        Get.snackbar(
          "Sign Up Failed",
          "You have alreday registered",
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
    }
  }
}
