import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class NoNewsView extends StatelessWidget {
  const NoNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const Center(
        child: Text(
          'There is No News Now Try Later',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
