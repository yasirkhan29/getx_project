import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_project/SignUp/components/gender_selection.dart';
import 'package:getx_project/SignUp/components/signup_background.dart';
import 'package:getx_project/SignUp/components/signup_mobile.dart';
import 'package:getx_project/SignUp/components/signup_profile_pictuer.dart';
import 'package:getx_project/SignUp/components/signup_textfiled%20_decorator.dart';
import 'package:getx_project/SignUp/components/signup_textfiled.dart';
import 'package:getx_project/controller/gender_selection_controller.dart';
import 'package:getx_project/controller/signup_controller.dart';
import 'package:getx_project/login/login_page.dart';
import 'package:getx_project/view/commponent/custom_button.dart';
import 'package:getx_project/view/commponent/mytheme.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  Signupcontroller signupcontroller = Get.put(Signupcontroller());

  GenderSelectionController genderSelectionController = Get.find();

  final _globalkey = GlobalKey<FormState>();
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: signupBackground(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _globalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                //
                SizedBox(
                  height: 20,
                ),
                // signup profile pictuer
                signupProfilepictuer(),
                //
                SizedBox(
                  height: 20,
                ),
                // sign up text decorator
                signUpTextfielddecorater(
                    child: signUpuseridtextfiled(
                        useridcontroller: nameController,
                        useridErrorText: "Name can not be empty",
                        useridhintText: "Enter Name",
                        useridhintcolor: Colors.purple,
                        useridTextFieldprefixIcon: Icons.person,
                        useridTextFieldpreixIconColor: Colors.purple,
                        onuseridvaleChange: (value) {})),

                // email id decorator
                signUpTextfielddecorater(
                    child: signUpuseridtextfiled(
                        useridcontroller: emailController,
                        useridErrorText: "Email id can not be empty",
                        useridhintText: "Enter Email",
                        useridhintcolor: Colors.purple,
                        useridTextFieldprefixIcon: Icons.email,
                        useridTextFieldpreixIconColor: Colors.purple,
                        onuseridvaleChange: (value) {})),
                // Mobile id decorator
                signUpTextfielddecorater(
                    child: signUpMobiletextfiled(
                        useridcontroller: mobileController,
                        useridErrorText: "Mobile no can not be empty",
                        useridhintText: "Enter Mobile",
                        useridhintcolor: Colors.purple,
                        useridTextFieldprefixIcon: Icons.phone,
                        useridTextFieldpreixIconColor: Colors.purple,
                        onuseridvaleChange: (value) {})),
                // password decorator
                signUpTextfielddecorater(
                    child: signUpuseridtextfiled(
                        useridcontroller: passController,
                        useridErrorText: "Password can not be empty",
                        useridhintText: "Enter Password",
                        useridhintcolor: Colors.purple,
                        useridTextFieldprefixIcon: Icons.lock,
                        useridTextFieldpreixIconColor: Colors.purple,
                        onuseridvaleChange: (value) {})),
                // Conforim pass decorator
                signUpTextfielddecorater(
                    child: signUpuseridtextfiled(
                        useridcontroller: confirmPassController,
                        useridErrorText: "Password can not be empty",
                        useridhintText: "Re-Password enter",
                        useridhintcolor: Colors.purple,
                        useridTextFieldprefixIcon: Icons.lock,
                        useridTextFieldpreixIconColor: Colors.purple,
                        onuseridvaleChange: (value) {})),
                // Gender
                signUpTextfielddecorater(child: GenderSelection()),
                // custom button
                custom_button(
                    handleButtonClick: () {
                      signup();
                    },
                    buttonColor: MyTheme.loginbuttonColor,
                    buttontext: "Sign Up",
                    textColor: Colors.white),
                SizedBox(
                  height: 10,
                ),
                // Already account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account ?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Get.to(() => LoginPage());
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  void signup() {
    final _isValid = _globalkey.currentState!.validate();
    if (_isValid) {
      signupcontroller.signUpUser(
          nameController.text,
          emailController.text,
          mobileController.text,
          passController.text,
          confirmPassController.text,
          genderSelectionController.selectionGender.value);
    } else {
      return null;
    }
  }
}
