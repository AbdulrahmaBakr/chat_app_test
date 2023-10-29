import 'package:chat_app/screens/chatPage.dart';
import 'package:chat_app/screens/loginPage.dart';
import 'package:chat_app/screens/registerPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const chatApp());
}

class chatApp extends StatelessWidget {
  const chatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        loginPage.id: (context) => loginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        chatPage.id: (context) => chatPage(),
      },
      initialRoute: loginPage.id,
    );
  }
}
