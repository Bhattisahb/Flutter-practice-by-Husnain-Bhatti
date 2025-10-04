import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';
import 'about_screen.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = true;
  String? _error;
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Use real weather API with your API key
      final weather = await _weatherService.getCurrentWeather();
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _searchCity() async {
    if (_cityController.text.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final weather = await _weatherService.getWeatherByCity(
        _cityController.text.trim(),
      );
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'City not found or API error';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadWeather),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _getGradientColors(),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Search bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          hintText: 'Enter city name',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          hintStyle: const TextStyle(color: Colors.white70),
                        ),
                        style: const TextStyle(color: Colors.white),
                        onSubmitted: (_) => _searchCity(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: _searchCity,
                    ),
                  ],
                ),
              ),

              // Weather content
              Expanded(child: _buildWeatherContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.white),
            const SizedBox(height: 16),
            Text(
              _error!,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _loadWeather, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (_weather == null) {
      return const Center(
        child: Text(
          'No weather data available',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // City name and country
          Text(
            '${_weather!.cityName}, ${_weather!.country}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Current date
          Text(
            DateFormat('EEEE, MMMM d').format(DateTime.now()),
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),

          const SizedBox(height: 32),

          // Weather icon and temperature
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Weather icon
              Image.network(
                _weather!.weatherIconUrl,
                width: 120,
                height: 120,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.wb_sunny,
                    size: 120,
                    color: Colors.white,
                  );
                },
              ),

              const SizedBox(width: 16),

              // Temperature
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _weather!.temperatureString,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 72,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    'Feels like ${_weather!.feelsLikeString}',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Weather description
          Text(
            _weather!.description.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 32),

          // Weather details cards
          _buildWeatherDetailsGrid(),

          const SizedBox(height: 32),

          // Sun times
          _buildSunTimes(),
        ],
      ),
    );
  }

  Widget _buildWeatherDetailsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildWeatherDetailCard(
          'Humidity',
          '${_weather!.humidity}%',
          Icons.water_drop,
        ),
        _buildWeatherDetailCard(
          'Wind Speed',
          '${_weather!.windSpeed} m/s',
          Icons.air,
        ),
        _buildWeatherDetailCard(
          'Pressure',
          '${_weather!.pressure} hPa',
          Icons.speed,
        ),
        _buildWeatherDetailCard(
          'Visibility',
          '${_weather!.visibility} km',
          Icons.visibility,
        ),
      ],
    );
  }

  Widget _buildWeatherDetailCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSunTimes() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Icon(
                Icons.wb_sunny_outlined,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(height: 8),
              const Text(
                'Sunrise',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                DateFormat('HH:mm').format(_weather!.sunrise),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.wb_sunny, color: Colors.white, size: 32),
              const SizedBox(height: 8),
              const Text(
                'Sunset',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                DateFormat('HH:mm').format(_weather!.sunset),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Color> _getGradientColors() {
    if (_weather == null) {
      return [Colors.blue.shade700, Colors.blue.shade900];
    }

    final hour = DateTime.now().hour;

    // Morning (6-12)
    if (hour >= 6 && hour < 12) {
      return [Colors.orange.shade300, Colors.blue.shade400];
    }
    // Afternoon (12-18)
    else if (hour >= 12 && hour < 18) {
      return [Colors.blue.shade400, Colors.blue.shade600];
    }
    // Evening (18-20)
    else if (hour >= 18 && hour < 20) {
      return [Colors.orange.shade400, Colors.purple.shade600];
    }
    // Night (20-6)
    else {
      return [Colors.indigo.shade800, Colors.black];
    }
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}
