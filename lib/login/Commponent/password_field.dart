import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class userpasstextfiled extends StatefulWidget {
  final TextEditingController userpasscontroller;
  final String userpassErrorText;
  final String userpasshintText;
  final Color userpasshintcolor;
  final IconData userpassTextFieldprefixIcon;
  final Color userpassTextFieldpreixIconColor;
  final Function onuserpassvaleChange;
  final IconData suffixIcon;
  final Color suffixIconColor;

  const userpasstextfiled({
    super.key,
    required this.userpasscontroller,
    required this.userpassErrorText,
    required this.userpasshintText,
    required this.userpasshintcolor,
    required this.userpassTextFieldprefixIcon,
    required this.userpassTextFieldpreixIconColor,
    required this.onuserpassvaleChange,
    required this.suffixIcon,
    required this.suffixIconColor,
  });

  @override
  State<userpasstextfiled> createState() => _userpasstextfiledState();
}

class _userpasstextfiledState extends State<userpasstextfiled> {
  bool ispasswordvisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.userpasscontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return widget.userpassErrorText;
        } else {
          return null;
        }
      },
      onChanged: (value) {
        widget.onuserpassvaleChange(value);
      },
      cursorColor: Theme.of(context).colorScheme.secondary,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      obscureText: ispasswordvisible ? false : true,
      decoration: InputDecoration(
          hintText: widget.userpasshintText,
          hintStyle: TextStyle(color: widget.userpasshintcolor),
          border: InputBorder.none,
          prefixIcon: Icon(
            widget.userpassTextFieldprefixIcon,
            color: widget.userpassTextFieldpreixIconColor,
          ),
          suffixIcon: IconButton(
            icon: ispasswordvisible
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
            color: widget.suffixIconColor,
            onPressed: () {
              setState(() {
                ispasswordvisible = !ispasswordvisible;
              });
            },
          )),
    );
  }
}
