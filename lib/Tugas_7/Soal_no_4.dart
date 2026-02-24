import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SoalNo4 extends StatefulWidget {
  const SoalNo4({super.key});

  @override
  State<SoalNo4> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SoalNo4> {

DateTime? jamdinding;


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
            Text("Soal no 4",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            ),
            Text("Pilih tanggal lahir"),
            
            SizedBox(height: 20,),

            ElevatedButton(onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                setState(() {
                  jamdinding = picked;
                });
              }
            },
            child:Text("Jam")
            ),
             Text(jamdinding == null? "Tanggal Lahir: " : "Tanggal Lahir: ${DateFormat()}"),

          ],
        ),
       ),
      );
  }
}