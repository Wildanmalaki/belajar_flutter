import 'package:belajar_flutter/Tugas_7/drawerpage.dart';
import 'package:belajar_flutter/Tugas_7/tentangaplikasi.dart';
import 'package:flutter/material.dart';

class ButtomBar extends StatefulWidget {
  const ButtomBar({super.key});

  @override
  State<ButtomBar> createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  int _selectectedIndex = 0;
  
  
  final List<Widget> _widgetOptions = [
    const Drawerpage(), 
    const Tentangaplikasi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectectedIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectectedIndex,
        onTap: (value) {
          setState(() {
            _selectectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang kami', 
          ),
        ],
      ),
    );
  }
}