import 'package:flutter/material.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  String selectedDay = 'Semua Hari';

  final List<Map<String, String>> jadwalKuliah = [
    {
      'mataKuliah': 'Pemrograman Berbasis Mobile',
      'sks': '3',
      'hari': 'Senin',
      'jam': '08:00–10:30',
      'kelas': 'A',
    },
    {
      'mataKuliah': 'E-Business',
      'sks': '3',
      'hari': 'Senin',
      'jam': '10:30–13:00',
      'kelas': 'A',
    },
    {
      'mataKuliah': 'Metodologi Penelitian',
      'sks': '3',
      'hari': 'Selasa',
      'jam': '11:20–13:50',
      'kelas': 'A',
    },
    {
      'mataKuliah': 'Prak. Pemrograman Berbasis Mobile',
      'sks': '1',
      'hari': 'Selasa',
      'jam': '13:50–16:20',
      'kelas': 'A',
    },
    {
      'mataKuliah': 'Manajemen Proyek',
      'sks': '3',
      'hari': 'Rabu',
      'jam': '09:41–12:10',
      'kelas': 'B',
    },
    {
      'mataKuliah': 'Enterprise Software Engineering',
      'sks': '3',
      'hari': 'Kamis',
      'jam': '10:30–13:00',
      'kelas': 'A',
    },
    {
      'mataKuliah': 'Geoinformatika',
      'sks': '2',
      'hari': 'Jumat',
      'jam': '08:01–09:40',
      'kelas': 'B',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredJadwal = selectedDay == 'Semua Hari'
        ? jadwalKuliah
        : jadwalKuliah.where((item) => item['hari'] == selectedDay).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Jadwal Kuliah')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: selectedDay,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDay = newValue!;
                });
              },
              items: <String>[
                'Semua Hari',
                'Senin',
                'Selasa',
                'Rabu',
                'Kamis',
                'Jumat',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredJadwal.length,
              itemBuilder: (context, index) {
                final item = filteredJadwal[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(item['mataKuliah'] ?? ''),
                    subtitle: Text('${item['jam']} | ${item['hari']} | Kelas ${item['kelas']}'),
                    trailing: Text('${item['sks']} SKS'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
