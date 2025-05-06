import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> kegiatan = [
    {'nama': 'Kerjakan Tugas', 'tanggal': '6 Mei 2025', 'selesai': false},
    {'nama': 'UTS Pemrograman Berbasis Mobile', 'tanggal': '7 Mei 2025', 'selesai': false},
    {'nama': 'UTS Enterprise Software Engineering', 'tanggal': '8 Mei 2025', 'selesai': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kegiatan Mahasiswa')),
      body: ListView.builder(
        itemCount: kegiatan.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(kegiatan[index]['nama']),
            subtitle: Text(kegiatan[index]['tanggal']),
            value: kegiatan[index]['selesai'],
            onChanged: (bool? value) {
              setState(() {
                kegiatan[index]['selesai'] = value!;
              });
            },
          );
        },
      ),
    );
  }
}
