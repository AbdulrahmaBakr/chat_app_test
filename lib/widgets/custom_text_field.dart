import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomFormTextFiled extends StatelessWidget {
  String? hintName;
  Function(String)? onChange;
  bool? obscure;
  Widget? suffixIcon;

  CustomFormTextFiled(
      {super.key,
      required this.hintName,
      this.onChange,
      this.suffixIcon,
      required this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure!,
      validator: (value) {
        if (value!.isEmpty) {
          return "wrong";
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintName,
        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
