import 'package:flutter/material.dart';
import 'package:madrid_store/screen/menu.dart';

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
         colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEAB308),
          primary: const Color(0xFFEAB308),
          secondary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}