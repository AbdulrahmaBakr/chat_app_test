import 'package:chat_app/const/constants.dart';
import 'package:chat_app/screens/registerPage.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'chatPage.dart';
import '../helper/snakPar.dart';
import '../widgets/custom_botton.dart';

bool? obscure;

class loginPage extends StatefulWidget {
  loginPage({super.key});
  static String id = 'LoginPgae';

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
                SizedBox(height: 100),
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
                SizedBox(height: 40),
                Row(
                  children: [
                    const Text(
                      'Login',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontFamily: 'Pacifico'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomFormTextFiled(
                  obscure: false,
                  onChange: (email) => emailAddress = email,
                  hintName: 'Email  ',
                ),
                SizedBox(height: 10),
                CustomFormTextFiled(
                  obscure: true,
                  // suffixIcon: GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       obscure = !obscure!;
                  //     });
                  //   },
                  //   child: obscure!
                  //       ? Icon(Icons.visibility)
                  //       : Icon(Icons.visibility_off),
                  // ),
                  onChange: (pass_word) => password = pass_word,
                  hintName: 'Password',
                ),
                SizedBox(height: 20),
                CustonBotton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginMethod();
                        Navigator.pushNamed(context, chatPage.id,
                            arguments: emailAddress);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'invalid-email') {
                          showMessage(context, 'invalid-email ');
                        } else if (e.code == 'wrong-password') {
                          showMessage(context, 'wrong-password $e');
                        } else {
                          showMessage(context, 'there is a prob $e ');
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  textName: 'Login',
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, chatPage.id),
                      child: Text(
                        'don\'t have an account ? ',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 20,
                            color: Color.fromARGB(255, 171, 169, 169)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: Text(
                        '  Register . . . . ',
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
  }
}

Future<void> loginMethod() async {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress!,
    password: password!,
  );
}
