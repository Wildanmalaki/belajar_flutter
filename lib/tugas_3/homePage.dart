import 'package:flutter/material.dart';

class HomepageTugas3 extends StatelessWidget {
  const HomepageTugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //APP BAR LOGIN 

      appBar: AppBar(
        title: Text("SIGN UP"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.5),
        child: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        height: 0.5,
          ),
      ),
    ),

    //BODY APLIKASI MYFIELD
    
    //LOGO MY FIELD

    body: 
    Padding(padding: EdgeInsets.all(5),
    child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/ChatGPT_Image_Feb_9__2026__01_39_33_PM-removebg-preview (1).png",
            width: 250,
            height: 250,
            ),
          ),  
          
          //FORM LOGIN 
          
          Container(  //KMEMBUAT BACKGROUND DAN GARIS STROKE
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10), 
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10)           //untuk ujung biar melengkug
            ),
            padding: EdgeInsets.all(20), 
            child: 
            Column(
              children: [
                //kolom NAMA DEPAN
                TextField(
                  showCursor: true,
                  autofocus: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide
                      (color: Colors.white)
                    ),
                    prefixIcon: Icon(Icons.person_2),
                    hintText: ("Nama depan"),
                    labelText: ("Nama Depan")
                  ),
                ),

                //buat kasih spaci atau jarak 
                SizedBox(
                  height: 10,
                ),


                //kolom Nama Belakang
                TextField(
                  showCursor: true,
                  autofocus: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide
                      (color: Colors.white)
                      
                    ),
                    prefixIcon: Icon(Icons.person_2),
                    hintText: ("Nama Belakang"),
                    labelText: ("Nama Belakang"),
                  ),
                ),

                //buat kasih spaci atau jarak 
                SizedBox(
                  height: 10,
                ),

                  //Kolom Email
                  TextField(
                  showCursor: true,
                  autofocus: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide
                      (color: Colors.white)
                    ),
                    prefixIcon: Icon(Icons.mail),
                    hintText: ("Email"),
                    labelText: ("Email")
                  ),
                ),
              
                //buat kasih spaci atau jarak 
                SizedBox(
                  height: 10,
                ),


               //Kolom Password
                  TextField(
                  showCursor: true,
                  autofocus: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide
                      (color: Colors.white)
                    ),
                    prefixIcon: Icon(Icons.key),
                    hintText: ("Passwprd"),
                    labelText: ("Password")
                  ),
                ),

                //buat kasih spaci atau jarak 
                SizedBox(
                  height: 10,
                ), 
              ],
            ),  
          ),
          Column(
            children: [
              Text("Sign up with "),
              SizedBox(height: 10),
              GridView.count(crossAxisCount:3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 40,
              crossAxisSpacing: 40,
              childAspectRatio: 3/4,


              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff2845D6),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    Icon(Icons.facebook,
                    size: 40,
                    ),
                  ],
                )
              ],
              ),
            ],
          )
        ],
      )
    )
    );
  }
}