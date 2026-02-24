import 'package:belajar_flutter/Tugas_4/homePage.dart';
import 'package:belajar_flutter/Tugas_6_FlutterB5/login_page.dart';
import 'package:belajar_flutter/Tugas_6_FlutterB5/startPage.dart';
import 'package:belajar_flutter/Tugas_7/Soal_no_1.dart';
import 'package:belajar_flutter/Tugas_7/Soal_no_2.dart';
import 'package:belajar_flutter/Tugas_7/Soal_no_3.dart';
import 'package:belajar_flutter/Tugas_7/Soal_no_4.dart';
import 'package:belajar_flutter/Tugas_7/buttombar.dart';
import 'package:belajar_flutter/Tugas_7/drawerpage.dart';
import 'package:belajar_flutter/Tugas_7/soal_no_5.dart';
import 'package:belajar_flutter/tugas_3/Homepage2.dart';
import 'package:belajar_flutter/tugas_3/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home : ButtomBar()
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}