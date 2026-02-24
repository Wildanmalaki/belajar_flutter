import 'package:flutter/material.dart';

class SoalNo3 extends StatefulWidget {
  const SoalNo3({super.key});

  @override
  State<SoalNo3> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SoalNo3> {
String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            Text("TUGAS no 3",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            ),
            Text("DropDownButton",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            ),

        DropdownButton<String>(
          value: selected,
          hint: Text("Pilih kategori"),
          items: [
          "Elektronik",
          "Pakaian",
          "Makanan",
          "Lainnya"
          ].map((String item) {
          return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selected = value;
        });
      },
    ),
          ]
        ),
      ),
       
      );
  }
}