import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
      backgroundColor: Color(0xff007E6E),
      title: Text("Informasi Pengguna"), 
      centerTitle: true,
      ), 

      // Body 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
          Center( 
            child: Text("Kenalan yuk",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
       ),
          Center( 
            child: 
            Container(
              height: (500),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.amber),
              child: 
              Column (
                children: [ 
                  Text("Biodata",
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
              ),
            ),
              Row(
                children: [
                  Icon(Icons.info_sharp, color: Colors.pink),
                  Text("Nama: Wildan Ganteng"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.info_sharp, color: Colors.pink),
                  Text("Hobi: Mancing"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.info_sharp, color: Colors.pink),
                  Text("Tempat Lahir: Pinang Ranti"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.info_sharp, color: Colors.pink),
                  Text("Hobi : Ngoding"),
                ],
              ),
                ],

              ),
            ),
          ),
          ],
            
          ),
          
        );
  } 
}