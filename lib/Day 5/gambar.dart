import 'package:belajar_flutter/Day%205/Column.dart';
import 'package:belajar_flutter/Day%205/Scaffold.dart';
import 'package:flutter/material.dart';

class Gambar extends StatelessWidget {
  const Gambar({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Column(
        children: [
          // ColumnDay5(),
          // Latihan(),

          // //Container
          Image.asset("assets/image/wildan.jpg")
          
        ],
      );
    
  }
}