import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/button_widget.dart';
import 'package:news_app/widgets/show_dialog_message.dart';
import 'package:news_app/widgets/text_field_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff73747E),
                  Color.fromARGB(255, 21, 22, 31),
                  Color(0xff0E101B),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                        height: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFieldWidget(
                    onChanged: (data) {
                      email = data;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegExp = RegExp(r'^[^@]+@gmail\.com$');
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    labelText: 'Email',
                    hintText: 'example@gmail.com',
                    text: 'Email',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    onChanged: (data) {
                      password = data;
                    },
                    labelText: 'Password',
                    hintText: '**********',
                    text: 'Password',
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: ButtonWidget(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {});
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            ); 
                            Navigator.pushNamed(context, 'NewsHomeView');
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialogMessage(
                                  message: 'LogIn Success',
                                  tittle: 'Success',
                                  color: Colors.blue[600],
                                );
                              },
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              //print('Error code: ${e.code}');
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialogMessage(
                                    message:
                                        'User not found. Try registering now.',
                                    tittle: 'User Not Found',
                                  );
                                },
                              );
                            } else if (e.code == 'wrong-password') {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialogMessage(
                                    message: e.message ??
                                        'An error occurred. Code: ${e.code}',
                                    tittle: 'Incorrect Password',
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialogMessage(
                                    tittle: 'Error',
                                    message: e.message ?? 'An error occurred',
                                  );
                                },
                              );
                            }
                          }
                        }

                        setState(() {});
                      },
                      text: 'Login',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'RegisterView');
                      },
                      child: Text(
                        'Dont have account ? Register now',
                        style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
