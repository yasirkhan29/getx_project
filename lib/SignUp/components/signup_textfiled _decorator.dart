import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_project/view/commponent/mytheme.dart';

class signUpTextfielddecorater extends StatelessWidget {
  final Widget child;
  signUpTextfielddecorater({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
          color: MyTheme.loginpageBoxColor,
          borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}
