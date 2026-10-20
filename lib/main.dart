import 'package:flutter/material.dart';

// Class Mahasiswa sesuai instruksi tugas
class Mahasiswa {
  String nama;
  String nim;
  String prodi;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.prodi,
  });

  // Method untuk menampilkan informasi biodata
  String tampilkan() {
    return 'Nama: $nama\nNIM: $nim\nProdi: $prodi';
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuat instance dari class Mahasiswa
    Mahasiswa mhs = Mahasiswa(
      nama: 'Apriza Wahyu Setiawan',
      nim: '241080200065',
      prodi: 'Teknik Informatika',
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Biodata Diri'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                mhs.tampilkan(), // Memanggil method tampilkan()
                style: const TextStyle(fontSize: 18, height: 1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}