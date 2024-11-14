import 'package:flutter/material.dart';
import 'package:food_app/Cubit/app_bloc_providers.dart';
import 'package:food_app/Home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const AppBlocProviders(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));
  }
}
