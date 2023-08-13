import 'package:flutter/material.dart';
import 'package:project_uas/surah.dart';
import 'package:project_uas/surahservice.dart';

import 'detail.dart';

// ignore: must_be_immutable
class SearchSurah extends StatefulWidget {
  late String keyword;

  SearchSurah({super.key, required this.keyword});
  // const SearchSurah({super.key});

  @override
  State<SearchSurah> createState() => _SearchSurahState();
}

class _SearchSurahState extends State<SearchSurah> {
  late Future data;
  List<Surah> data2 = [];
  bool isSearching = false;
  TextEditingController searchtext = TextEditingController();
  bool cekData = true;

  @override
  void initState() {
    data = SurahService().getSurah();
    data.then((value) {
      setState(() {
        data2 = value;
        data2 = data2
            .where((element) =>
                element.nama
                    .toLowerCase()
                    .contains(widget.keyword.toLowerCase()) ||
                element.nomor
                    .toLowerCase()
                    .contains(widget.keyword.toLowerCase()))
            .toList();
        if (data2.isEmpty) {
          cekData = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? const Text("List Surah",
                style: TextStyle(color: Colors.white, fontSize: 26))
            : TextField(
                controller: searchtext,
                style: const TextStyle(color: Colors.white, fontSize: 26),
                decoration: const InputDecoration(
                    hintText: "Pencarian",
                    hintStyle: TextStyle(color: Colors.black)),
                onSubmitted: (value) {},
              ),
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
              icon: !isSearching
                  ? const Icon(Icons.search, color: Colors.white)
                  : const Icon(Icons.cancel, color: Colors.black))
        ],
      ),
      body: data2.isEmpty
          ? cekData
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : const Center(
                  child: Text(
                    "Pencarian Tidak Ditemukan",
                    style: TextStyle(fontSize: 30),
                  ),
                )
          : ListView.builder(
              itemCount: data2.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.lightGreen,
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (_) => DetailSurah(surah: data2[index]));
                      Navigator.push(context, route);
                    },
                    title: Text(data2[index].nama),
                  ),
                );
              }),
    );
  }
}
