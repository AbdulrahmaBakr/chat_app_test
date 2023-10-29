import 'package:chat_app/const/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/meesageModel.dart';
import '../widgets/buble_Chat_Widget.dart';
import '../widgets/textFieldWidget.dart';

class chatPage extends StatelessWidget {
  static String id = 'chatPage';
  final ScrollController _controller = ScrollController();

  TextEditingController controller = TextEditingController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessage);

  chatPage({super.key});

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kcreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(
                Message.fromjson(snapshot.data!.docs[i]),
              );
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      logoApp,
                      height: 40,
                    ),
                    // ignore: prefer_const_constructors
                    Text('Chat'),
                  ],
                ),
                backgroundColor: bgColor,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return messageList[index].id == email
                              ? bubleChat(message: messageList[index])
                              : bubleChatTwo(
                                  message: messageList[index],
                                );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add(
                          {
                            keMessage: data,
                            kcreatedAt: DateTime.now(),
                            'id': email
                          },
                        );
                        controller.clear();
                        _controller.animateTo(
                          0,
                          duration: Duration(seconds: 2),
                          curve: Curves.easeIn,
                        );
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.send,
                          color: Colors.green,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        hintText: 'Type your message here...',
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Text('problem has happened');
          }
        });
  }
}
