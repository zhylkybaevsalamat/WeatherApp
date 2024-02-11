import 'dart:math';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = 'hot';
  String smile = '🥵';
  int degree = 0;
  Color bgColor = Colors.orange;

  int numbers({required min, required max}) {
    return min + Random().nextInt(max - min);
  }

  void changeWeather() {
    Random random = Random();
    setState(() {
      var result = random.nextInt(5);
      if (result == 0) {
        smile = '🥵';
        text = 'hot';
        degree = numbers(min: 30, max: 50);
        bgColor = Colors.orange;
      } else if (result == 1) {
        text = 'Normal';
        smile = '🤩';
        degree = numbers(min: 15, max: 30);
        bgColor = Colors.green;
      } else if (result == 2) {
        smile = '🌧';
        text = 'rain';
        degree = numbers(min: 10, max: 15);
        bgColor = Colors.grey;
      } else if (result == 3) {
        smile = '🌥';
        text = 'cool';
        degree = numbers(min: 1, max: 10);
        bgColor = Colors.pink;
      } else if (result == 4) {
        smile = '❄️';
        text = 'cold';
        degree = numbers(min: -10, max: 0);
        bgColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$text',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                '$smile',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                '$degree C',
                style: TextStyle(fontSize: 50),
              ),
              TextButton(
                  onPressed: () {
                    changeWeather();
                  },
                  child: Text('Change the weather')),
            ],
          ),
        ),
      ),
    );
  }
}
