import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Lapanganmodel {
  String nama_lapangan;
  String jenis_olahraga;
  String alamat;
  Lapanganmodel({
    required this.nama_lapangan,
    required this.jenis_olahraga,
    required this.alamat,
  });
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama_lapangan': nama_lapangan,
      'jenis_olahraga': jenis_olahraga,
      'alamat': alamat,
    };
  }

  factory Lapanganmodel.fromMap(Map<String, dynamic> map) {
    return Lapanganmodel(
      nama_lapangan: map['nama_lapangan'] as String,
      jenis_olahraga: map['jenis_olahraga'] as String,
      alamat: map['alamat'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Lapanganmodel.fromJson(String source) => Lapanganmodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
