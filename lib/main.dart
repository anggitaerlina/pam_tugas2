import 'package:flutter/material.dart';
import 'package:pam_tugas2/favorite.dart';
import 'package:pam_tugas2/homepage.dart';
import 'package:pam_tugas2/menu.dart';
import 'package:pam_tugas2/team.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/team': (context) => Team(),
        '/menu': (context) => const HalamanUtama(),
        '/favorite': (context) => const FavoritePage(),

      },
    );
  }
}
