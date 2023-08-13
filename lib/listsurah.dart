import 'package:flutter/material.dart';
import 'package:project_uas/detail.dart';
import 'package:project_uas/search.dart';
import 'package:project_uas/surah.dart';
import 'package:project_uas/surahservice.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Al Quran Indonesia',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future data;
  List<Surah> data2 = [];
  bool isSearching = false;
  TextEditingController searchtext = TextEditingController();

  @override
  void initState() {
    data = SurahService().getSurah();
    data.then((value) {
      setState(() {
        data2 = value;
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
                onSubmitted: (value) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          SearchSurah(keyword: searchtext.text)));
                },
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
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
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
