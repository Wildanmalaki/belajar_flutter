
import 'package:belajar_flutter/Tugas_10/homepagetgs10.dart';
import 'package:flutter/material.dart';

class loginTugas10 extends StatefulWidget {
  const loginTugas10({super.key});

  @override
  State<loginTugas10> createState() => _loginTugas10State();
}

class _loginTugas10State extends State<loginTugas10> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment. center,
        children: [
          Text("Silahkan login untuk melanjutkan"),
        
        SizedBox(height: 20,),

          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              hint: Text(
                "masukan Email anda",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              prefixIcon: Icon(Icons.email_outlined)
            ),
          ),

          SizedBox(height: 20,),
          
        TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              hint: Text(
                "Masukan Password anda",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),

        SizedBox(height: 20),

        ElevatedButton(onPressed: () {
          
        }, 
        child: Text("Login",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          
        ),
        ),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Belum punya akun?",
            style: TextStyle(),),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageTugas10()));
            }, 
            child: Text("Daftar disini",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.amber
            ),
            ),
            ),
            Container(
              height: 20,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageTugas10()));
                  }, 
                  child: Text("Lupa Password?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber
                  ),
                  ),
                  ),
                ],
              ),
            )
          ],
        )

        ]  
      )
      ),
    );
  }
}