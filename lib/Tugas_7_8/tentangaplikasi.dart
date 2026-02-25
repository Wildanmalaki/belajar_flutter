import 'package:flutter/material.dart';

class Tentangaplikasi extends StatefulWidget {
  const Tentangaplikasi({super.key});

  @override
  State<Tentangaplikasi> createState() => _TentangaplikasiState();
}

class _TentangaplikasiState extends State<Tentangaplikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang kami",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.amber,        
      ),

      body: Padding(padding: EdgeInsetsGeometry.all(14),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo_myfield.png',
            scale: 2.5,
            ),
            Text("My Field adalah aplikasi yang memudahkan untuk komunitas olahraga untuk booking lapangan melalui aplikasi kami yang telah kami"),
          ],
        ),
      ),
      ),
    );
  }
}