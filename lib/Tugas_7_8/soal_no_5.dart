import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Soalno5 extends StatefulWidget {
  const Soalno5({super.key});

  @override
  State<Soalno5> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Soalno5> {

TimeOfDay? pengingat; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 7",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: Color(0xffBED4CB),
        centerTitle: true,
      ),
      
      body: Center(
        child: Column(
          children: [
            Text("Soal no 5",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            ),

            Text("Atur Pengingat",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
            ),

            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) { 
                  setState(() {
                    pengingat = picked;
                  });
                }
              },
              child: Text("Pilih jam"),
              ),
              Text(pengingat == null? 'Pengingat diatur pukul:' : "Pengingat diatur pukul: ${pengingat!.format(context)}")
          ],
        ),
      )
        );
  }
}