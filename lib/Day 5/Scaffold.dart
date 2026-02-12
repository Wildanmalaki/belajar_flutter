import 'package:belajar_flutter/Day%205/Column.dart';
import 'package:belajar_flutter/Day%205/Row.dart';
import 'package:belajar_flutter/Day%205/gambar.dart';
import 'package:flutter/material.dart';

class Latihan extends StatelessWidget {
  const Latihan ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //appbar
        //Backgroundnya
        backgroundColor: Color(0xffBF4646),
        title: Text("Profil Saya"),
        centerTitle: true,
      ), //appBar akhir
      body: Column(children: [ColumnDay5(), RowDay5(), Gambar()]),
    );
  }
}