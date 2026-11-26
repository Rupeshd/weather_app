/// One snapshot of the current weather for a place.
///
/// Every field is `final`: once we have the data we never change it.
/// To show new weather we simply create a new WeatherData object.
class WeatherData {
 const WeatherData({
   required this.city,
   required this.country,
   required this.conditionId,
   required this.description,
  required this.iconCode,
   required this.temperature,
   required this.feelsLike,
   required this.tempMin,
   required this.tempMax,
   required this.humidity,
   required this.pressure,
   required this.visibility,
   required this.windSpeed,
   required this.windDeg,
   required this.sunrise,
   required this.sunset,
   required this.updatedAt,
   required this.timezoneOffset,
 });


 final String city;
 final String country;
 final int conditionId; // e.g. 500 = light rain, 800 = clear sky
 final String description; // e.g. "light rain"
 final String iconCode; // e.g. "10d" (d = day, n = night)
 final double temperature; // °C
 final double feelsLike; // °C
 final double tempMin; // °C
 final double tempMax; // °C
 final int humidity; // %
 final int pressure; // hPa
 final int visibility; // metres
 final double windSpeed; // m/s
 final int windDeg; // direction the wind comes FROM, 0 = north
 final DateTime sunrise; // UTC
 final DateTime sunset; // UTC
  final DateTime updatedAt; // UTC
 final int timezoneOffset; // seconds from UTC, e.g. 32400 for Korea (+9h)


 // Step 4 adds:  factory WeatherData.fromJson(Map<String, dynamic> json)


 /// Converts a UTC time to the clock time *in this city*
 /// (not in the phone's time zone).
 DateTime toCityTime(DateTime utcTime) =>
     utcTime.toUtc().add(Duration(seconds: timezoneOffset));


 /// The OpenWeather icon code ends with "d" in daytime and "n" at night.
 bool get isDay => iconCode.endsWith('d');
}


