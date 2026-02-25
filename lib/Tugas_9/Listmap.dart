import 'package:flutter/material.dart';

class ListMapTugas9 extends StatefulWidget {
  const ListMapTugas9({super.key});

  

  @override
  State<ListMapTugas9> createState() => _ListMapTugas9State();
}

class _ListMapTugas9State extends State<ListMapTugas9> {
  
List<Map<String, dynamic>> namaBuah = [
    {'Nama' : 'Buah-Buahan','icon':Icons.apple},
    {'Nama' : 'Sayur-sayuran','icon':Icons.face_2},
    {'Nama' : 'Makan-makanan','icon':Icons.face_5},
    {'Nama' : 'Vitamin','icon':Icons.keyboard_capslock_rounded},
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("ListMap",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
      ),

      body: ListView.builder(
        itemCount: namaBuah.length,
        itemBuilder: (BuildContext context, int index) {
          final data = namaBuah[index];
          return ListTile(
            title: Text(data["Nama"]),
            leading: Icon(data['icon'])
          );
        }
    ),
    );
  }
}