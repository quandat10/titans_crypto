import 'package:flutter/material.dart';
import 'package:titans_crypto/screens/auth/auth-screen.dart';
import 'package:titans_crypto/screens/splash/splash-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        AuthScreen.routeName: (_) => const AuthScreen()
      },
    );
  }
}
