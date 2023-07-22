import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_project/SignUp/signup.dart';
import 'package:getx_project/view/commponent/background.dart';
import 'package:getx_project/view/commponent/custom_button.dart';
import 'package:getx_project/login/login_page.dart';
import 'package:getx_project/view/commponent/mytheme.dart';

class welcomePage extends StatelessWidget {
  welcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to family",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  "images/undraw_Balloons.png",
                  width: size.width * 0.7,
                ),
                custom_button(
                  handleButtonClick: loginButtonClickHandler,
                  textColor: Colors.white,
                  buttonColor: MyTheme.loginbuttonColor,
                  buttontext: "Login",
                ),
                SizedBox(
                  height: 15,
                ),
                custom_button(
                  handleButtonClick: signupButtonClickHandler,
                  textColor: Colors.black,
                  buttonColor: MyTheme.signupbuttonColor,
                  buttontext: "Sight Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginButtonClickHandler() {
    Get.to(() => LoginPage());
  }

  signupButtonClickHandler() {
    Get.to(() => Signup());
  }
}
