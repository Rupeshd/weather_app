import 'package:flutter/material.dart';
import 'package:wether_app/data/sample_weather.dart';
import 'package:wether_app/screens/weather_screen.dart';
void main() {
 runApp(const WeatherApp());
}
class WeatherApp extends StatelessWidget {
 const WeatherApp({super.key});
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Weather',
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       brightness: Brightness.dark,
       colorSchemeSeed: Colors.teal,
       useMaterial3: true,
     ),
     // Part 1: show the screen with fake data.
     // Part 2: this becomes `const LoadingScreen()`.
     home: WeatherScreen(weather: sampleWeather),
   );
 }
}
