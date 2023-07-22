import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_project/controller/signup_controller.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class signupProfilepictuer extends StatelessWidget {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  Signupcontroller signupcontroller = Get.find();
  signupProfilepictuer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(
          () => CircleAvatar(
            backgroundImage: signupcontroller.isprofilepocpathset.value == true
                ? FileImage(File(signupcontroller.profilepicpath.value))
                    as ImageProvider
                : AssetImage("images/avatar.jpg"),
            radius: 80,
          ),
        ),
        Positioned(
            bottom: 0,
            child: InkWell(
              child: Icon(Icons.camera),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => bottomsheet(context));
              },
            )),
      ],
    );
  }

  Widget bottomsheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          Text(
            "Choose Profile photo",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      color: Colors.purple,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                onTap: () {
                  takephoto(ImageSource.gallery);
                },
              ),
              SizedBox(
                width: 80,
              ),
              InkWell(
                child: Column(
                  children: [
                    Icon(Icons.camera, color: Colors.purple),
                    Text(
                      "Camera",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                onTap: () {
                  takephoto(ImageSource.camera);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> takephoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    signupcontroller.setprofileImagePath(pickedFile!.path);

    Get.back();
  }
}
