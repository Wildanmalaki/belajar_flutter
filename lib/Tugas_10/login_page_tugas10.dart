import 'package:belajar_flutter/Tugas_10/database/sqflite.dart';
import 'package:belajar_flutter/Tugas_10/form_daftar.dart';
import 'package:belajar_flutter/Tugas_10/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/Tugas_10/homepagetgs10.dart';

class LoginPageTugas10 extends StatefulWidget {
  const LoginPageTugas10({super.key});

  @override
  State<LoginPageTugas10> createState() => _LoginPageTugasBaruState();
}

class _LoginPageTugasBaruState extends State<LoginPageTugas10> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              "Selamat Datang di Aplikasi Kami",
              style: TextStyle(fontSize: 20, 
              fontWeight: FontWeight.bold,
              ),
              
            ),


            Text(
              "Silahkan login untuk melanjutkan",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20),

            /// EMAIL
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Masukan Email anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                prefixIcon: const Icon(Icons.email_outlined),
              ),
            ),

            const SizedBox(height: 20),

            /// PASSWORD
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Masukan Password anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                prefixIcon: const Icon(Icons.lock_outline),
              ),
            ),

            const SizedBox(height: 20),

            /// BUTTON LOGIN
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () async {
                  final UserModel? login = await DBhelper.loginUser(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (login != null) {
                    Prefererencehandler().storingIslogin(true);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Berhasil")));
                      await Future.delayed(const Duration(seconds: 2));
                      context.push(drawer)
                  }
                    
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const DrawerPageTugas10(),
                  //   ),
                  // );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),


            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                 DBhelper.registerUser(
                    UserModel(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Registrasi Berhasil")),
                  );
                },
                child: const Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// BELUM PUNYA AKUN
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormDaftarTugas10(),
                      ),
                    );
                  },
                  child: const Text(
                    "Daftar disini",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),

            /// LUPA PASSWORD
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormDaftarTugas10(),
                  ),
                );
              },
              child: const Text(
                "Lupa Password?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}