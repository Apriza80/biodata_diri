import 'package:flutter/material.dart';

void main() => runApp(const BiodataApp());

class BiodataApp extends StatelessWidget {
  const BiodataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biodata Diri',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3C72),
        ),
        useMaterial3: true,
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    const nama = 'Apriza Wahyu Setiawan';
    const nim = '241080200065';
    const prodi = 'Teknik Informatika';
    const semester = 4;
    const kota = 'Sidoarjo';
    const email = 'aprizawahyu@gmail.com';
    const hobi = ['Coding', 'Badminton', 'Membaca'];
    const keahlian = ['Flutter', 'Dart', 'HTML/CSS', 'MySQL'];
    // URL Foto Profil
    const fotoUrl = 'https://picsum.photos/200';

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text(
          'Biodata Diri',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3C72),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header Gradasi dengan Foto Profil
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Foto Profil Bulat
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 46,
                            backgroundImage: NetworkImage(fotoUrl),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          nama,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$nim | $prodi',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Isi Informasi Detail
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(Icons.timeline_outlined, 'Semester', 'Semester $semester'),
                        const Divider(height: 20, color: Color(0xFFEEEEEE)),
                        _buildInfoRow(Icons.location_city_outlined, 'Kota', kota),
                        const Divider(height: 20, color: Color(0xFFEEEEEE)),
                        _buildInfoRow(Icons.email_outlined, 'Email', email),
                        const Divider(height: 28, color: Color(0xFFEEEEEE)),

                        // Section Hobi
                        const Text(
                          'Hobi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF1E3C72),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: hobi
                              .map((item) => Chip(
                            avatar: const Icon(Icons.star, size: 16, color: Color(0xFF1E3C72)),
                            label: Text(item),
                            backgroundColor: const Color(0xFF1E3C72).withValues(alpha: 0.08),
                            side: BorderSide.none,
                          ))
                              .toList(),
                        ),
                        const SizedBox(height: 16),

                        // Section Keahlian
                        const Text(
                          'Keahlian',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF1E3C72),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: keahlian
                              .map((item) => Chip(
                            avatar: const Icon(Icons.code, size: 16, color: Colors.indigo),
                            label: Text(item),
                            backgroundColor: Colors.indigo.withValues(alpha: 0.08),
                            side: BorderSide.none,
                          ))
                              .toList(),
                        ),
                        const SizedBox(height: 20),

                        // Section Tentang Saya
                        const Text(
                          'Tentang saya',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF1E3C72),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Mahasiswa Teknik Informatika yang antusias terhadap pengembangan aplikasi mobile dan web menggunakan Flutter.',
                            style: TextStyle(color: Colors.black87, height: 1.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF1E3C72).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF1E3C72), size: 20),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}