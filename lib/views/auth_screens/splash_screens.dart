import 'dart:async';

import 'package:all_topics/views/auth_screens/phone_auth.dart';
import 'package:all_topics/views/home_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const SendOtpScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/splash2.png",
              height: 180,
              width: 190,),
               SizedBox(
                height: 30,
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.blue,
                valueColor: AlwaysStoppedAnimation(Colors.green),
                strokeWidth: 5,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
