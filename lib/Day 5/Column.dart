import 'package:flutter/material.dart';

class ColumnDay5 extends StatelessWidget {
  const ColumnDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Nama : Wildan",
          style: TextStyle(fontSize: 50),
        ),
        
        Text(
          "Seseorang pelajar yang sedang belajar flutter"
        )
      ],
    );
  }
}