import 'package:flutter/material.dart';

void main() {
  runApp(const Weatherapp());
}

class Weatherapp extends StatefulWidget {
  const new({super.key});

  @override
  State<Weatherapp> createState() => _WeatherappState();
}

class _WeatherappState extends State<Weatherapp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}