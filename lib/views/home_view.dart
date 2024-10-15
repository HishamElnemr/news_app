import 'package:flutter/material.dart';
import 'package:news_app/views/intro_views/login_view.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginView(),
    );
  }
}

