import 'package:flutter/material.dart';

class HomePageTugas7 extends StatefulWidget {
  const HomePageTugas7({super.key});

  @override
  State<HomePageTugas7> createState() => _HomePageTugas7State();
}

class _HomePageTugas7State extends State<HomePageTugas7> {
  
  bool _ceklisbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffBED4CB),
        title: Text("Tugas 7", style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
      ),
      
    body: Padding(padding: EdgeInsetsGeometry.all(16),
    child: Center(
      child: Column(
        children:  [

          //Soal no 1
          Text("Soal no 1", 
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 24,
          ),),
          Text("Syarat dan kententuan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          ),
          
          Column(
            children: [
              Text("Saya menyetujui persyaratan",
              style: TextStyle(
                fontSize: 12,
              ),
              ),
              Checkbox(
                value: _ceklisbox, 
                onChanged: (bool? newValue) {
                  setState(() {
                    _ceklisbox = newValue ?? false;
                  });
                },
              ),
              Text(_ceklisbox ? 'Lanjutkan pendaftaran diperbolehkan' : 'Anda belum bisa melanjutkan'),
            ],
          ),
        
        SizedBox(height: 20,),
        
        ],
      ),
    ),
    )
    );
  }
}