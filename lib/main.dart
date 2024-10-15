import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_news_cubit.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/views/intro_views/login_view.dart';
import 'package:news_app/views/intro_views/register_view.dart';
import 'package:news_app/views/intro_views/welcome_page.dart';
import 'package:news_app/views/news_view/news_home_view.dart';
import 'package:news_app/views/news_view/tittle_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    BlocProvider(
      create: (context) => GetNewsCubit(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.id: (context) => const HomeView(),
        RegisterView.id: (context) => const RegisterView(),
        LoginView.id: (context) => const LoginView(),
        NewsHomeView.id: (context) => NewsHomeView(),
        TittleView.id: (context) => TittleView(),
      },
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}
