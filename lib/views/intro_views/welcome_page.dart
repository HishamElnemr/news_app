import 'package:flutter/material.dart';
import 'package:news_app/widgets/button_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/start_page.png'),
            const Text(
              'Welcome to my News App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'HomeView');
              },
              child: const ButtonWidget(
                text: 'Get Started',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
