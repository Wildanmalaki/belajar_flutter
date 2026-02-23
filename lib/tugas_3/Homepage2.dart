import 'package:flutter/material.dart';

class TugasPage3 extends StatelessWidget {
  const TugasPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TUGAS 3",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),

      body: Padding(padding: EdgeInsetsGeometry.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Color(0xffF7F8F0),
            ),
          
           ],
      ) ,
      ),
    );
  }
}