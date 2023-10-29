import 'package:chat_app/model/meesageModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/constants.dart';

class bubleChat extends StatelessWidget {
  bubleChat({super.key, required this.message});
  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(35),
          ),
          color: messageOne,
        ),
        child: Text(
          message.message,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontFamily: 'JosefinSans'),
        ),
      ),
    );
  }
}

class bubleChatTwo extends StatelessWidget {
  bubleChatTwo({super.key, required this.message});
  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(35),
          ),
          color: Colors.amber[200],
        ),
        child: Text(
          message.message,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontFamily: 'JosefinSans'),
        ),
      ),
    );
  }
}
