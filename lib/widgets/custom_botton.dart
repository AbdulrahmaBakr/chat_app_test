import 'package:flutter/material.dart';

class CustonBotton extends StatelessWidget {
  String textName;
  VoidCallback? onTap;
  CustonBotton({this.onTap, super.key, required this.textName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: double.infinity,
        height: 50,
        child: Center(child: Text(textName)),
      ),
    );
  }
}
