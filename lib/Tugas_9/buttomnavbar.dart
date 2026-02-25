import 'package:belajar_flutter/Tugas_9/List.dart';
import 'package:belajar_flutter/Tugas_9/Listmap.dart';
import 'package:belajar_flutter/Tugas_9/Model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageTugas9(),
    );
  }
}

class HomePageTugas9 extends StatefulWidget {
  const HomePageTugas9({super.key});

  @override
  State<HomePageTugas9> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageTugas9> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ListViewtugas(),
    ListMapTugas9(),
    ModelTugas9()
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "List Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Model",
          ),
        ],
      ),
    );
  }
}
