import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/views/addNotePage.dart';
import 'package:notes/views/homePage.dart';
import 'package:notes/views/loginPage.dart';
import 'package:notes/views/registrationPage.dart';
import 'package:notes/views/splashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state)=>SplashScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state)=>HomePage(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state)=>LoginPage(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state)=>RegistrationPage(),
        ),
        GoRoute(
          path: '/add',
          builder: (context, state)=>AddNotePage(),
        ),
      ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Notes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        ),
        routerConfig: _router,
      ),
    );
  }
}


