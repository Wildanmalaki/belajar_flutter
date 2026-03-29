import 'package:flutter/material.dart';

void main() {
  runApp(const Tugas3ppkd());
}

class Tugas3ppkd extends StatelessWidget {
  const Tugas3ppkd({super.key});

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
  final TextEditingController alamat = TextEditingController();

  List<Map<String, String>> dataList = [];

  void tambahData() {
    if (nama.text.isEmpty ||
        email.text.isEmpty ||
        hp.text.isEmpty ||
        alamat.text.isEmpty) {
      return;
    }

    setState(() {
      dataList.add({
        "nama": nama.text,
        "email": email.text,
        "hp": hp.text,
        "alamat": alamat.text,
      });

      nama.clear();
      email.clear();
      hp.clear();
      alamat.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tugas 3"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // ================= FORM =================
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
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
                    controller: alamat,
                    decoration: const InputDecoration(
                      labelText: "Alamat",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: tambahData,
                    child: const Text("Tambah Data"),
                  ),
                ],
              ),
            ),

            // ================= GRID =================
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(
                  dataList.length >= 6 ? dataList.length : 6,
                  (index) {
                    final data = index < dataList.length
                        ? dataList[index]
                        : {
                            "nama": "Item ${index + 1}",
                            "email": "-",
                            "hp": "-",
                            "alamat": "-"
                          };

                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.primaries[
                                index % Colors.primaries.length],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        // LABEL DI ATAS (STACK)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Text(
                              data["nama"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}