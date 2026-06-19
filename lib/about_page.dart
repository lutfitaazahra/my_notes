import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📝', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 12),
            const Text(
              'My Notes',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Versi 2.0 — GoRouter Edition',
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            const Divider(height: 32),
            const Text(
              'My Notes adalah aplikasi pencatat sederhana yang dibuat '
              'sebagai tugas Mata Kuliah Pemrograman Perangkat Bergerak I, '
              'Program Studi D3 Manajemen Informatika, Fakultas Teknik dan '
              'Ilmu Komputer, Universitas Sains Al-Qur\'an (UNSIQ).',
              style: TextStyle(fontSize: 14, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pada pertemuan ini, aplikasi direfactor untuk menggunakan '
              'GoRouter, StatefulShellRoute untuk bottom navigation, Drawer, '
              'path parameter, dan animasi transisi custom.',
              style: TextStyle(fontSize: 14, height: 1.6),
            ),
            const SizedBox(height: 24),
            Text(
              'Dibuat oleh Lutfita Az-zahra (2024160005)',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[500],
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}