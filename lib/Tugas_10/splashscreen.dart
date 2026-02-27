import 'package:belajar_flutter/Tugas_10/homepagetgs10.dart';
import 'package:belajar_flutter/Tugas_10/login_page_tugas10.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Pastikan import ini ada untuk timer

class SplashScreenTugas10 extends StatefulWidget {
  const SplashScreenTugas10({super.key});

  @override
  State<SplashScreenTugas10> createState() => _SplashScreenTugas10State();
}

class _SplashScreenTugas10State extends State<SplashScreenTugas10> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPageTugas10()), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo_myfield.png",
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 5),
            const Text(
              "Selamat Datang di Aplikasi Kami",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}