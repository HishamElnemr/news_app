import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/widgets/button_widget.dart';
import 'package:news_app/widgets/show_dialog_message.dart';
import 'package:news_app/widgets/text_field_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    super.key,
  });
  static String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email;
  String? password;
  String? userName;
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
                  const SizedBox(height: 0100),
                  const Text(
                    textAlign: TextAlign.center,
                    'Create an account',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Tajawal',
                      color: Colors.white,
                      height: 1,
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    onChanged: (data) {
                      password = data;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    labelText: 'Password',
                    hintText: '**********',
                    text: 'Password',
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ButtonWidget(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {});
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, 'NewsHomeView');
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialogMessage(
                                  message: 'Register Success',
                                  tittle: 'Success',
                                  color: Colors.blue[600],
                                );
                              },
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialogMessage(
                                    message:
                                        'Your password is too weak try add more characters',
                                    tittle: 'Invalid Password',
                                  );
                                },
                              );
                            } else if (e.code == 'email-already-in-use') {
                              showDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialogMessage(
                                    message:
                                        "The account already exists for that email.",
                                    tittle: 'User Is Exists',
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
                          } catch (e) {
                            print(e);
                          }
                        }
                        setState(() {});
                      },
                      text: 'Register',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context, 'LoginView');
                      },
                      child:  Text(
                        'Have account ? Login now',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 0100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
