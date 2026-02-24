import 'package:belajar_flutter/Tugas_7/Soal_no_1.dart';
import 'package:belajar_flutter/Tugas_7/Soal_no_2.dart';
import 'package:belajar_flutter/Tugas_7/Soal_no_3.dart';
import 'package:belajar_flutter/Tugas_7/Soal_no_4.dart';
import 'package:belajar_flutter/Tugas_7/soal_no_5.dart';
import 'package:flutter/material.dart';

class Drawerpage extends StatefulWidget {
  const Drawerpage({super.key});

  @override
  State<Drawerpage> createState() => _DrawerpageState();
}

class _DrawerpageState extends State<Drawerpage> {

  int _selectedindex = 0;

  static List<Widget> listWidget = <Widget>[
    HomePageTugas7(),
    SoalNo2(),
    SoalNo3(),
    SoalNo4(),
    Soalno5(),
  ];

  void _onItemTapped(int indeks) {
    setState(() {
      _selectedindex = indeks;
    });
    Navigator.pop(context); // Tutup drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyField",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      
      body: listWidget[_selectedindex],

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Soal 1"),
              selected: _selectedindex == 0,
              onTap: () => _onItemTapped(0),
            ),

            ListTile(
              leading: Icon(Icons.looks_two),
              title: Text("Soal 2"),
              selected: _selectedindex == 1,
              onTap: () => _onItemTapped(1),
            ),

            ListTile(
              leading: Icon(Icons.looks_3),
              title: Text("Soal 3"),
              selected: _selectedindex == 2,
              onTap: () => _onItemTapped(2),
            ),

            ListTile(
              leading: Icon(Icons.looks_4),
              title: Text("Soal 4"),
              selected: _selectedindex == 3,
              onTap: () => _onItemTapped(3),
            ),

            ListTile(
              leading: Icon(Icons.looks_5),
              title: Text("Soal 5"),
              selected: _selectedindex == 4,
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),

      
    );
  }
}