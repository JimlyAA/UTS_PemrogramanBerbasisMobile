import 'package:flutter/material.dart';

class AkunPage extends StatelessWidget {
  final Function(bool) onThemeChanged;
  final bool isDarkMode;

  const AkunPage({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil Saya')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Foto profil bundar
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Jimly.jpg'),
                backgroundColor: Colors.blue[100], // fallback jika gambar gagal
              ),
              const SizedBox(height: 24),

              // Nama
              const Text(
                'Jimly Asidiq Anwar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 8),

              // NIM
              const Text(
                'NIM: 4522210018',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 4),

              // Email
              const Text(
                'Email: jimlyasidiq@gmail.com',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 24),

              // Switch tema
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Mode Gelap'),
                  Switch(
                    value: isDarkMode,
                    onChanged: onThemeChanged,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
