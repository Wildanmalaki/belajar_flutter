import 'package:flutter/material.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  bool showimage1 = false;
  bool showimage2 = false;
  bool isBookmarked = false;
  bool showDetail = false;
  bool showSecretText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MENU",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: const [
          Icon(Icons.menu_rounded, color: Colors.white, size: 34),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView( 
        child: Column(
          children: [

            //Container 1

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: const Color(0xffECECEC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SOAL NO 1",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Halo Wildan, Pusing ya?",
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bo,
                    ),
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showimage1 = !showimage1;
                        showimage2 = false;
                      });
                    },
                    child: const Text("Tenang ada aku"),
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showimage2 = !showimage2;
                        showimage1 = false;
                      });
                    },
                    child: const Text("haha biarin"),
                  ),

                  const SizedBox(height: 20),

                  //Gambar 1
                  if (showimage1)
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Image.asset(
                        "assets/image/wildan.jpg",
                        // height: 200,
                        // width: double.infinity,
                      ),
                    ),

                  // Gambar 2
                  if (showimage2)
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        "assets/image/ChatGPT_Image_Feb_9__2026__01_39_33_PM-removebg-preview (1).png",
                        // height: 200,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10,),

            //Container 2

            Container(
              width: double.infinity,
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: Color(0xffFFEDC7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("SOAL NO 2",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                ),

                Text("Tombol Interaktif",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal
                ),
                ),
              
              SizedBox(
                height: 8,
              ),

                Text("Icon Bookmark",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),

              IconButton(
               icon: Icon(
               Icons.bookmark,
               size: 50,
               color: isBookmarked ? Colors.red : Colors.grey,
               ),
               onPressed: () {
               setState(() {
               isBookmarked = !isBookmarked;
               
              }
            );
          },
                 ),

              //Logic Bookmarks

              if (isBookmarked)
              Text(
              "pusing ya?",
              style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
              ),
              ),

               ],
              ),
            ),
            
            SizedBox(
              height: 10,
            ),

            //container 3
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: Color(0xffF7F0F0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("SOAL NO 3",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                ),  

                Text("Textbotton",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                ),  
              
              SizedBox(
                height: 20,
              ),
              
              TextButton(
              onPressed: () {
              setState(() {
              showDetail = !showDetail;
          });
        },
              child: Text(
              showDetail ? "Sembunyikan" : "Lihat Selengkapnya",
              style: TextStyle(fontSize: 16),
        ),
      ),

              SizedBox(height: 10,),

              if (showDetail)
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
              "Jadi ini adalah kisah seseorang yang bangkit dari kegagalan, dan ingin menjadi lebih kuat dan sukses dari sebelumnya.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14)
              )
              )
              ],
             ),
            ),

            SizedBox(height: 10,),
            //container 4
            Container(
              width: double.infinity,
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: Color(0xffFFEDC7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("SOAL NO 4",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                ),

                Text("InkWell",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal
                ),
                ),
               
        InkWell(
        onTap: () {
          setState(() {
            showSecretText = !showSecretText;
          });

          print('Kotak berhasil disentuh!');
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 150,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "Dan?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      SizedBox(height: 10,),

      if (showSecretText)
        Text(
          "ngapa ??",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
    ],
  ),
),
      
              ]
              )

            )
    );
      }
    }
        
        
      
  
      

    
