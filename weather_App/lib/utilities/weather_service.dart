// lib/utilities/weather_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import './apifile.dart';

class Weather {
  final String city;
  final String country;
  final double tempC;
  final String description;
  final int humidity;
  final double windMs;
  final String iconCode;

  Weather({
    required this.city,
    required this.country,
    required this.tempC,
    required this.description,
    required this.humidity,
    required this.windMs,
    required this.iconCode,
  });

  String get iconUrl => "https://openweathermap.org/img/wn/$iconCode@4x.png";

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'] ?? '',
      country: json['sys']?['country'] ?? '',
      tempC: (json['main']?['temp'] ?? 0).toDouble(),
      description: (json['weather']?[0]?['description'] ?? '').toString(),
      humidity: (json['main']?['humidity'] ?? 0).toInt(),
      windMs: (json['wind']?['speed'] ?? 0).toDouble(),
      iconCode: (json['weather']?[0]?['icon'] ?? '01d').toString(),
    );
  }
}

class WeatherService {
  static const _base = "https://api.openweathermap.org/data/2.5/weather";

  Future<Weather> fetchByCity(String city) async {
    final uri = Uri.parse("$_base?q=$city&appid=$apiId&units=metric");
    final res = await http.get(uri).timeout(const Duration(seconds: 15));

    if (res.statusCode == 200) {
      final map = jsonDecode(res.body) as Map<String, dynamic>;
      return Weather.fromJson(map);
    } else {
      String msg = "Failed to load weather (${res.statusCode})";
      try {
        final map = jsonDecode(res.body);
        final apiMsg = map['message'];
        if (apiMsg is String && apiMsg.isNotEmpty) {
          msg = apiMsg;
        }
      } catch (_) {}
      throw Exception(msg);
    }
  }
}
