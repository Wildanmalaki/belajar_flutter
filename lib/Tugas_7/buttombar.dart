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
  List<Widget> _widgetOptions = [Drawerpage(), Tentangaplikasi()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home)),
        BottomNavigationBarItem(icon: Icon(Icons.info))

      ],
      onTap: (value) {
      setState(() {
        _selectectedIndex = value;
      });
      },
      currentIndex: _selectectedIndex,
      ),

      body : _widgetOptions[_selectectedIndex]

    );
  }
}