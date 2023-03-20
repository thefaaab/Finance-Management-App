import 'package:finance_app/screens/Home.dart';
import 'package:finance_app/screens/Statistics.dart';
import 'package:finance_app/widgets/bnb.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNav(),
      // home: Statistics(),
      // home: Home(),
    );
  }
}
