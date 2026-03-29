import 'package:belajar_flutter/tugas%2011-12/database/sqflite.dart';
import 'package:belajar_flutter/tugas%2011-12/models/lapanganmodel.dart';

class LapanganController {
  static Future<void> registerlapangan(Lapanganmodel lapangan) async {
    final dbs = await DBHelper.db();
    await dbs.insert('lapangan',lapangan.toMap());
    print(lapangan.toMap());
  }

  static Future<List<Lapanganmodel>> getAllDonatur() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query("donatur");
    print(results.map((e) => Lapanganmodel.fromMap(e)).toList());
    return results.map((e) => Lapanganmodel.fromMap(e)).toList();
  }
}