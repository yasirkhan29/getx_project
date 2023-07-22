// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_project/SignUp/signup.dart';
import 'package:getx_project/login/Commponent/login_background.dart';
import 'package:getx_project/login/Commponent/password_field.dart';
import 'package:getx_project/login/Commponent/textfile_decorater.dart';
import 'package:getx_project/login/Commponent/user_id_text_filed.dart';
import 'package:getx_project/view/commponent/custom_button.dart';
import 'package:getx_project/view/commponent/mytheme.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  TextEditingController useridcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  String useridErrorText = "User id can not be empty";
  String useridhintText = "Enter user Id";
  Color useridhintcolor = Colors.purple;
  IconData useridTextFieldprefixIcon = Icons.person;
  Color useridTextFieldpreixIconColor = Colors.purple;

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: // login background call
          LoginBackground(
              child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/Login.png"),
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            // Text field
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // textfile_decoratar call
                  Textfielddecorater(
                    // useridtextfiled call
                    child: useridtextfiled(
                      useridcontroller: useridcontroller,
                      useridErrorText: useridErrorText,
                      useridhintText: useridhintText,
                      useridhintcolor: useridhintcolor,
                      useridTextFieldprefixIcon: useridTextFieldprefixIcon,
                      useridTextFieldpreixIconColor:
                          useridTextFieldpreixIconColor,
                      onuseridvaleChange: (value) {},
                    ),
                  ),

                  // for passowrd
                  Textfielddecorater(
                      child: userpasstextfiled(
                    userpasscontroller: passcontroller,
                    userpassErrorText: "Please fill password",
                    userpasshintText: "Enter password",
                    userpasshintcolor: Colors.purple,
                    userpassTextFieldprefixIcon: Icons.lock,
                    userpassTextFieldpreixIconColor: Colors.purple,
                    suffixIcon: Icons.visibility_off,
                    suffixIconColor: Colors.purple,
                    onuserpassvaleChange: (value) {},
                  )),
                  custom_button(
                      handleButtonClick: () {},
                      buttonColor: MyTheme.loginbuttonColor,
                      buttontext: "Login",
                      textColor: Colors.white),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => Signup());
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
