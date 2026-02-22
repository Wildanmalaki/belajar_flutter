
import 'package:flutter/material.dart';

class LoginMyField extends StatefulWidget {
  const LoginMyField({super.key});

  @override
  State<LoginMyField> createState() => _LoginMyFieldState();
}

class _LoginMyFieldState extends State<LoginMyField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //Background_login_Page
      SizedBox.expand(
        child: Image.asset("assets/images/Background_Login_page.jpg",
        fit: BoxFit.cover,
        alignment: Alignment.center,
        ),
      ),

        //transparan gelap
      Container(
        // color: Colors.black.withOpacity(0.3),
      ),
      
      //Form loginnya
      Center(
        child: Container(
          width: 300,
          height: 400,
          padding: EdgeInsets.all(20),
          color: Colors.white.withOpacity(0.3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Email :",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.all(20)
                ),
              ),
            SizedBox(height: 10),
            ],
          ),
        ),
      )
      ],
      ),
      );
  }
}