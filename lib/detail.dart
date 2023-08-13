import 'package:flutter/material.dart';
import 'surah.dart';

class DetailSurah extends StatelessWidget {
  final Surah surah;

  const DetailSurah({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("List Surah",
              style: TextStyle(color: Colors.white, fontSize: 26)),
          backgroundColor: Colors.green,
          elevation: 0),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
            child: Text(surah.nama),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Text(surah.asma),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Text(surah.arti),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Text(surah.keterangan),
          ),
        ],
      )),
    );
  }
}
