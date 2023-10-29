import 'package:chat_app/const/constants.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/screens/chatPage.dart';
import 'package:chat_app/screens/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/snakPar.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_text_field.dart';

String? emailAddress;
String? password;
bool isLoading = false;

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPgae';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Color(0xFF274460),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset(
                  logoApp,
                  scale: .8,
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Scholar Chat',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Pacifico'),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  children: const [
                    Text(
                      'Register',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontFamily: 'Pacifico'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomFormTextFiled(
                  obscure: false,
                  onChange: (email) => emailAddress = email,
                  hintName: 'Email  ',
                ),
                const SizedBox(height: 10),
                CustomFormTextFiled(
                  obscure: true,
                  onChange: (pass_word) => password = pass_word,
                  hintName: 'Password',
                ),
                const SizedBox(height: 20),
                CustonBotton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await regiasterMethod();

                        Navigator.pushNamed(context, chatPage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showMessage(
                              context, 'weak password retrying stronge one ');
                        } else if (e.code == 'email-already-in-use') {
                          showMessage(context, 'email already in use ');
                        }
                      } catch (e) {
                        showMessage(context, 'there is a prob  ');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  textName: 'Register',
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account ? ',
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 20,
                          color: Color.fromARGB(255, 171, 169, 169)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '  Login . . . . ',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }

  Future<void> regiasterMethod() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );
  }
}
