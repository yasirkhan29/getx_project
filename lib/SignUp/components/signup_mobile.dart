import 'package:flutter/material.dart';

class signUpMobiletextfiled extends StatelessWidget {
  final TextEditingController useridcontroller;
  final String useridErrorText;
  final String useridhintText;
  final Color useridhintcolor;
  final IconData useridTextFieldprefixIcon;
  final Color useridTextFieldpreixIconColor;
  final Function onuseridvaleChange;

  const signUpMobiletextfiled({
    super.key,
    required this.useridcontroller,
    required this.useridErrorText,
    required this.useridhintText,
    required this.useridhintcolor,
    required this.useridTextFieldprefixIcon,
    required this.useridTextFieldpreixIconColor,
    required this.onuseridvaleChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 11,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      controller: useridcontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return useridErrorText;
        } else {
          return null;
        }
      },
      onChanged: (value) {
        onuseridvaleChange(value);
      },
      cursorColor: Theme.of(context).colorScheme.secondary,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      decoration: InputDecoration(
          counterText: "",
          hintText: useridhintText,
          hintStyle: TextStyle(color: useridhintcolor),
          border: InputBorder.none,
          prefixIcon: Icon(
            useridTextFieldprefixIcon,
            color: useridTextFieldpreixIconColor,
          )),
    );
  }
}
