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

  // Method untuk menampilkan/mengembalikan data biodata
  Map<String, String> getBiodataMap() {
    return {
      'Nama': nama,
      'NIM': nim,
      'Prodi': prodi,
    };
  }

  // Method tampilkan() sesuai instruksi tugas
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
    // Inisialisasi object Mahasiswa
    Mahasiswa mhs = Mahasiswa(
      nama: 'Apriza Wahyu Setiawan',
      nim: '241080200065',
      prodi: 'Teknik Informatika',
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biodata Diri',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4F6F9),
        appBar: AppBar(
          title: const Text(
            'Profil Mahasiswa',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.indigo,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Avatar Profil
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.indigo,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                mhs.nama,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  mhs.prodi,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.indigo.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Card Informasi Detail
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _buildInfoTile(Icons.badge_outlined, 'NIM', mhs.nim),
                      const Divider(height: 24),
                      _buildInfoTile(Icons.school_outlined, 'Program Studi', mhs.prodi),
                      const Divider(height: 24),
                      _buildInfoTile(Icons.person_outline, 'Nama Lengkap', mhs.nama),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pendukung untuk baris informasi
  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.indigo),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}