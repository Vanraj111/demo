import 'package:code/Swatch.dart';
import 'package:code/apio/api1.dart';
import 'package:code/apio/apierepo.dart';
import 'package:code/home.dart';
import 'package:code/todo/all.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}
class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/':(context) => Home(),
        '/swatch':(context) => Swatch(),
        '/todo':(context) => toDolist(),
        '/myapp':(context) => MyApp(),
        '/api1':(context) => Api1(),
        // '/impic':(context) => Impic(),
      },
    );
  }
}
