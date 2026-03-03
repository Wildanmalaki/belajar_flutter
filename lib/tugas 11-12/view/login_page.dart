import 'package:belajar_flutter/Tugas_10/database/sqflite.dart';
import 'package:belajar_flutter/Tugas_10/form_daftar.dart';
import 'package:belajar_flutter/Tugas_10/models/user_model.dart';
import 'package:belajar_flutter/tugas%2011-12/view/pendaftaran_user.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/Tugas_10/homepagetgs10.dart';

class LoginPageTugas11 extends StatefulWidget {
  LoginPageTugas11({super.key});

  @override
  State<LoginPageTugas11> createState() => _LoginPageTugasBaruState();
}

class _LoginPageTugasBaruState extends State<LoginPageTugas11> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// BACKGROUND IMAGE
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_login.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// OVERLAY 
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          /// FORM LOGIN
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 40),

                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 10),

                   Text(
                    "Silahkan login untuk melanjutkan",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 40),

                  /// EMAIL
                  TextFormField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  /// PASSWORD
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  /// BUTTON LOGIN
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff007E6E),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () async {
                        final UserModel? login =
                            await DBhelper.loginUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        if (login != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                              content: Text("Login Berhasil"),
                            ),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DrawerPageTugas10(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Email / Password Salah"),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  /// DAFTAR
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PendaftaranUser(),
                        ),
                      );
                    },
                    child: Text(
                      "Belum punya akun? Daftar disini",
                      style: TextStyle(
                        color:Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      "Lupa Password?",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}