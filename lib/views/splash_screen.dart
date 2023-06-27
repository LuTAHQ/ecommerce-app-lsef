import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate a loading delay
    Future.delayed(Duration(seconds: 4), () {
      // Navigate to the login screen or the desired screen
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffBCEBFA),
        Color(0xff1F404A),
      ], begin: Alignment.centerLeft, end: Alignment.bottomRight)),
      child: Center(
        child: Image.asset('assets/images/quick_buy_logo1.png'),
      ),
    ),
    );
  }
}
