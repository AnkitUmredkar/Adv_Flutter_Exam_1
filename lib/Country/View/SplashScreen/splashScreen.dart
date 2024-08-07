import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../HomePage/homePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/country.json',
                height: height * 0.53,
              ),
              Text('One Country, One Spirit',
                  style: TextStyle(
                    color: Colors.blue.shade800,
                      fontSize: width * 0.065,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins')),
            ],
          ),
        )
      ),
    );
  }
}
