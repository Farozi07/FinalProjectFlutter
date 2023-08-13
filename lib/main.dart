import 'package:flutter/material.dart';
import 'package:project_uas/listsurah.dart';

void main() {
  runApp(const HomeSurah());
}

class HomeSurah extends StatelessWidget {
  const HomeSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al Quran Indonesia',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Scaffold(body: Home()),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}
