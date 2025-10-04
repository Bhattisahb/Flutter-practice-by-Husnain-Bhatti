import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import '../models/weather.dart';

class WeatherService {
  static const String apiKey =
      '41aa6838600bdf98fe84ce601c9c655c'; // OpenWeatherMap API key
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';

  // Get current location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  // Get weather by coordinates
  Future<Weather> getWeatherByCoordinates(double lat, double lon) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric',
      ),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // Get weather by city name
  Future<Weather> getWeatherByCity(String cityName) async {
    final response = await http.get(
      Uri.parse('$baseUrl/weather?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data for $cityName');
    }
  }

  // Get current weather using location
  Future<Weather> getCurrentWeather() async {
    try {
      final position = await getCurrentLocation();
      return await getWeatherByCoordinates(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      // Fallback to a default city if location fails
      return await getWeatherByCity('London');
    }
  }

  // Mock weather data for demo purposes (when API key is not available)
  Weather getMockWeather() {
    return Weather(
      cityName: 'Demo City',
      temperature: 22.5,
      condition: 'Clear',
      description: 'clear sky',
      feelsLike: 25.0,
      humidity: 65,
      windSpeed: 3.5,
      pressure: 1013,
      visibility: 10.0,
      cloudiness: 20,
      sunrise: DateTime.now().subtract(const Duration(hours: 2)),
      sunset: DateTime.now().add(const Duration(hours: 8)),
      country: 'Demo',
      icon: '01d',
    );
  }
}
