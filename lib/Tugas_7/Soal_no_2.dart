import 'package:flutter/material.dart';

class SoalNo2 extends StatefulWidget {
  const SoalNo2({super.key});

  @override
  State<SoalNo2> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SoalNo2> {

  bool modegelap = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: modegelap ? const Color.fromARGB(255, 63, 63, 63) : Color.fromARGB(255, 253, 253, 253),

      appBar: AppBar(
        title: Text("Tugas 7",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: Color(0xffBED4CB),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(padding: EdgeInsetsGeometry.all(5),
        child: Column(
          children: [
            Text("Soal no 2",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            Text("Mode Gelap",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            ),
            Switch(
              value: modegelap, onChanged: (val) {
                setState(() {
                  modegelap = val;
                });
              }
            )
          ],
        ),
        ),
      ),
    );
  }
}