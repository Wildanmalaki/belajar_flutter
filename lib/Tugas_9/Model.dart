import 'package:flutter/material.dart';
import 'data_lapangan.dart'; // sesuaikan dengan nama file kamu

class ModelTugas9 extends StatefulWidget {
  const ModelTugas9({super.key});

  @override
  State<ModelTugas9> createState() => _ModelTugas9State();
}

class _ModelTugas9State extends State<ModelTugas9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "MODEL",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: dataLapangan.length,
        itemBuilder: (context, index) {
          final lapangan = dataLapangan[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(lapangan.image),
              title: Text(
                lapangan.namaLapangan,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(lapangan.jenisLapangan),
              trailing: Text(lapangan.waktu),
            ),
          );
        },
      ),
    );
  }
}