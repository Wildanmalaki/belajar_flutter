import 'package:flutter/material.dart';

void main() {
  runApp(const Tugas4ppkd());
}

class Tugas4ppkd extends StatelessWidget {
  const Tugas4ppkd({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController hp = TextEditingController();
  final TextEditingController deskripsi = TextEditingController();

  List<Map<String, String>> dataList = [];

  void tambahData() {
    if (nama.text.isEmpty ||
        email.text.isEmpty ||
        hp.text.isEmpty ||
        deskripsi.text.isEmpty) {
      return;
    }

    setState(() {
      dataList.add({
        "nama": nama.text,
        "email": email.text,
        "hp": hp.text,
        "deskripsi": deskripsi.text,
      });

      nama.clear();
      email.clear();
      hp.clear();
      deskripsi.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tugas 4"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ===== FORM =====
          TextField(
            controller: nama,
            decoration: const InputDecoration(
              labelText: "Nama",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),

          TextField(
            controller: email,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),

          TextField(
            controller: hp,
            decoration: const InputDecoration(
              labelText: "No HP",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),

          TextField(
            controller: deskripsi,
            decoration: const InputDecoration(
              labelText: "Deskripsi",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: tambahData,
            child: const Text("Tambah Data"),
          ),

          const SizedBox(height: 20),

          // ===== LIST DATA =====
          ...List.generate(
            dataList.length >= 5 ? dataList.length : 5,
            (index) {
              final data = index < dataList.length
                  ? dataList[index]
                  : {
                      "nama": "Item ${index + 1}",
                      "email": "email@gmail.com",
                      "hp": "08123456789",
                      "deskripsi": "Contoh deskripsi",
                    };

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(data["nama"]!),
                  subtitle: Text(
                      "${data["email"]}\n${data["hp"]}\n${data["deskripsi"]}"),
                  isThreeLine: true,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}