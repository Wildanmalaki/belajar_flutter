import 'package:belajar_flutter/Tugas_6_FlutterB5/login_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}
class _StartPageState extends State<StartPage> {
  @override

  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginMyField(),
        ),
      );
    });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

    /// Bagian tengah (logo + text)
    Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_myfield.png',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              "Selamat datang!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),

    //Tulisan "Beta version"
    Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(
        "Beta Version by Wildan Malaki",
        style: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    ),
  ],
),
      
    );
  }
}