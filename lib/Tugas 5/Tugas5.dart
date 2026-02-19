import 'package:flutter/material.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  @override
  bool showimage1 = false;
  bool showimage2 = false;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //Appbar tulisan menu
      appBar: AppBar(
        //APPBAR
        title: Text(
          "MENU", //Tulisan Menu
          style: TextStyle(
            //text style
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, //untuk ditengah-tengah
        backgroundColor: Colors.green, //Warna Background

        actions: [
          Icon(Icons.menu_rounded, color: Colors.white, size: 34),
          SizedBox(width: 16), // jarak dari pinggir
        ],
      ),

      //Body aplikasi
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: Color(0xffECECEC),
            // child: Center(
            //   child: Text("Halo",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 35,
            //   ),
            //   ),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Halo Wildan, Pusing ya?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
          
                ElevatedButton(
                onPressed: () {
                setState(() {
                showimage1 = true;
                 });
                },
                child: Text("Tenang ada aku"),
                ),
              
                ElevatedButton(
                onPressed: () {
                setState(() {
                showimage2 = true;
                 });
                },
                child: Text("haha biarin"),
                ),
              
              
             ], 
            ),
          ),
          Container(
            
          )
        ],
      ),
      
    );
  }
}
