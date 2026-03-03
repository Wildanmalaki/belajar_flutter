import 'package:belajar_flutter/tugas%2011-12/models/lapanganmodel.dart';
import 'package:path/path.dart';
// import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'my_field.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
        await db.execute(
          'CREATE TABLE lapangan (id INTEGER PRIMARY KEY AUTOINCREMENT, nama_lapangan TEXT, jenis_olahraga TEXT, alamat TEXT)',
        );
      },
      version: 3,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            'CREATE TABLE lapangan (id INTEGER PRIMARY KEY AUTOINCREMENT, nama_lapangan TEXT, jenis_olahraga TEXT, alamat TEXT)',
          );
        }
      },
    );
  }

  static Future<void> registerlapangan(Lapanganmodel user) async {
    final dbs = await db();

    await dbs.insert('user', user.toMap());
    print(user.toMap());
  }

  static Future<Lapanganmodel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      "user",
      where: 'email = ? AND password = ?',
       whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return Lapanganmodel.fromMap(results.first);
    }
    return null;
  }
}
   
   
  
