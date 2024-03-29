import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

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
    // 가로 모드 고정
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft, // 허용되는 방향
      DeviceOrientation.landscapeRight,
    ]);

    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
        body: Stack(// Stack은 children끼리 겹치기 가능
            children: [
      StreamBuilder<AccelerometerEvent>(
          stream: accelerometerEventStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final event = snapshot.data!;
            List<double> accelerometerValues = [event.x, event.y, event.z];
            print(accelerometerValues);

            return Positioned(
              left: centerX + event.x * 35,
              top: centerY + event.x * 20,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.yellowAccent,
                  shape: BoxShape.circle,
                ),
                width: 100,
                height: 100,
              ),
            );
          })
    ]));
  }
}
