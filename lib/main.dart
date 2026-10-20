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
    const fotoUrl = 'https://picsum.photos/200';

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text(
          'Biodata Diri',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3C72),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Header Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: 38,
                              backgroundImage: NetworkImage(fotoUrl),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            nama,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '$nim | $prodi',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Detail Informasi
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(Icons.timeline_outlined, 'Semester', 'Semester $semester'),
                          const Divider(height: 14, color: Color(0xFFEEEEEE)),
                          _buildInfoRow(Icons.location_city_outlined, 'Kota', kota),
                          const Divider(height: 14, color: Color(0xFFEEEEEE)),
                          _buildInfoRow(Icons.email_outlined, 'Email', email),
                          const Divider(height: 20, color: Color(0xFFEEEEEE)),

                          // Hobi
                          const Text(
                            'Hobi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFF1E3C72),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: hobi
                                .map((item) => Chip(
                              avatar: const Icon(Icons.star, size: 14, color: Color(0xFF1E3C72)),
                              label: Text(item, style: const TextStyle(fontSize: 12)),
                              backgroundColor: const Color(0xFF1E3C72).withValues(alpha: 0.08),
                              side: BorderSide.none,
                              visualDensity: VisualDensity.compact,
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                            ))
                                .toList(),
                          ),
                          const SizedBox(height: 12),

                          // Keahlian
                          const Text(
                            'Keahlian',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFF1E3C72),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: keahlian
                                .map((item) => Chip(
                              avatar: const Icon(Icons.code, size: 14, color: Colors.indigo),
                              label: Text(item, style: const TextStyle(fontSize: 12)),
                              backgroundColor: Colors.indigo.withValues(alpha: 0.08),
                              side: BorderSide.none,
                              visualDensity: VisualDensity.compact,
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                            ))
                                .toList(),
                          ),
                          const SizedBox(height: 14),

                          // Tentang Saya
                          const Text(
                            'Tentang saya',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFF1E3C72),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Mahasiswa Teknik Informatika yang antusias terhadap pengembangan aplikasi mobile dan web menggunakan Flutter.',
                              style: TextStyle(color: Colors.black87, fontSize: 12, height: 1.3),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
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
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFF1E3C72).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, color: const Color(0xFF1E3C72), size: 18),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
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