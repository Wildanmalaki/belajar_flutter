import 'package:flutter/material.dart';

class ListViewtugas extends StatelessWidget {
  ListViewtugas({super.key});

  final List<String> kategori = [
    "Buah-buahan",
    "Elektronik",
    "Sayuran",
    "Makanan",
    "Mantan",
    "jeruk",
    "Guaganteng"
    "Buah-buahan",
    "Elektronik",
    "Sayuran",
    "Makanan",
    "Mantan",
    "jeruk",
    "Guaganteng"
    "Buah-buahan",
    "Elektronik",
    "Sayuran",
    "Makanan",
    "Mantan",
    "jeruk",
    "Guaganteng",
    "Buah-buahan",
    "Elektronik",
    "Sayuran",
    "Makanan",
    "Mantan",
    "jeruk",
    "Guaganteng"
    "Buah-buahan",
    "Elektronik",
    "Sayuran",
    "Makanan",
    "Mantan",
    "jeruk",
    "Guaganteng"
    "Buah-buahan",
    "Elektronik",
    "Sayuran",
    "Makanan",
    "Mantan",
    "jeruk",
    "Guaganteng",
    
  ];

//List
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.amber,
      ),

      body: Center(
        child: ListView.builder(
        itemCount: kategori.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 5),
            height: 50,
            color: const Color.fromARGB(255, 236, 236, 236),
            child: Text("$index : ${kategori[index]}"),
          );
        }
            ),
        

      ),

    
    );
  }
}