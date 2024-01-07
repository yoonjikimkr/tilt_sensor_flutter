import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SensorApp(),
    );
  }
}

class SensorApp extends StatelessWidget {
  const SensorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
        body: Stack(// Stack은 children끼리 겹치기 가능
            children: [
      Positioned(
        left: centerX,
        top: centerY,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.yellowAccent,
            shape: BoxShape.circle,
          ),
          width: 100,
          height: 100,
        ),
      )
    ]));
  }
}