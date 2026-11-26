import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wether_app/models/weather_data.dart';
import 'package:wether_app/utilities/constants.dart';
import 'package:wether_app/utilities/formatters.dart';
import 'package:wether_app/widgets/current_weather_header.dart';
import 'package:wether_app/widgets/gradient_background.dart';
import 'package:wether_app/widgets/info_tile.dart';
import 'package:wether_app/widgets/sun_times_card.dart';
import 'package:wether_app/widgets/wind_compass.dart';
// Checkpoint version: shows the data it receives.
// Part 3 adds: colours by weather, refresh, search and error messages.
class WeatherScreen extends StatelessWidget {
 const WeatherScreen({super.key, required this.weather});
 final WeatherData weather;
 @override
 Widget build(BuildContext context) {
   final WeatherData w = weather;
   return Scaffold(
     body: GradientBackground(
       colors: const [Color(0xFF1E6FD9), Color(0xFF4FA3E8)],
       child: SafeArea(
         child: ListView(
           padding: const EdgeInsets.all(kScreenPadding),
           children: [
             CurrentWeatherHeader(weather: w),
             const SizedBox(height: 32.0),
             SunTimesCard(
               sunrise: w.toCityTime(w.sunrise),
               sunset: w.toCityTime(w.sunset),
             ),
             const SizedBox(height: kGap),
             _TileRow(
               left: InfoTile(
                 icon: CupertinoIcons.thermometer,
                 label: 'Feels like',
                 value: '${w.feelsLike.round()}°',
               ),
               right: InfoTile(
                 icon: CupertinoIcons.drop_fill,
                 label: 'Humidity',
                 value: '${w.humidity}%',
               ),
             ),
             const SizedBox(height: kGap),
             _TileRow(
               left: InfoTile(
                 icon: CupertinoIcons.wind,
                 label: 'Wind',
                 value: '${w.windSpeed.toStringAsFixed(1)} m/s',
                 caption: 'From ${compassDirection(w.windDeg)}',
                 trailing: WindCompass(degrees: w.windDeg),
               ),
               right: InfoTile(
                 icon: CupertinoIcons.gauge,
                 label: 'Pressure',
                 value: '${w.pressure} hPa',
                 caption: 'Visibility ${(w.visibility / 1000).toStringAsFixed(1)} km',
               ),
             ),
              ],
         ),
       ),
     ),
   );
 }
}
/// Two tiles side by side with the same height.
class _TileRow extends StatelessWidget {
 const _TileRow({required this.left, required this.right});
 final Widget left;
 final Widget right;
 @override
 Widget build(BuildContext context) {
   return IntrinsicHeight(
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Expanded(child: left),
         const SizedBox(width: kGap),
         Expanded(child: right),
       ],
     ),
   );
 }
}


