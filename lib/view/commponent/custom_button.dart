import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class custom_button extends StatelessWidget {
  final Function handleButtonClick;
  late Color buttonColor, textColor;
  late String buttontext;
  custom_button({
    super.key,
    required this.handleButtonClick,
    required this.buttonColor,
    required this.buttontext,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)))),
          onPressed: () {
            handleButtonClick();
          },
          child: Text(
            buttontext,
            style: TextStyle(
                color: textColor, fontSize: 15, fontWeight: FontWeight.bold),
          )),
    );
  }
}
