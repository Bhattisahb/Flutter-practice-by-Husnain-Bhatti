// lib/ui/newfile.dart
import 'package:flutter/material.dart';
import '../utilities/apifile.dart';
import '../utilities/weather_service.dart';

class Climate extends StatefulWidget {
  const Climate({super.key});

  @override
  State<Climate> createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  final _svc = WeatherService();
  final _cityCtrl = TextEditingController(text: defaultCity);
  Future<Weather>? _future;

  @override
  void initState() {
    super.initState();
    _future = _svc.fetchByCity(defaultCity);
  }

  void _search() {
    final city = _cityCtrl.text.trim();
    if (city.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a city name.")),
      );
      return;
    }
    setState(() {
      _future = _svc.fetchByCity(city);
    });
  }

  @override
  void dispose() {
    _cityCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: _search,
            icon: const Icon(Icons.search, color: Colors.white),
            tooltip: "Search",
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            "images/Rain.jpg",
            fit: BoxFit.cover,
          ),

          // Gradient overlay for readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.35),
                  Colors.black.withOpacity(0.15),
                  Colors.black.withOpacity(0.55),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Search field
                  Material(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white.withOpacity(0.9),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          const Icon(Icons.location_city),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _cityCtrl,
                              textInputAction: TextInputAction.search,
                              onSubmitted: (_) => _search(),
                              decoration: const InputDecoration(
                                hintText: "Enter city (e.g., Lahore)",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: _search,
                            icon: const Icon(Icons.arrow_forward),
                            tooltip: "Go",
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Weather content
                  Expanded(
                    child: FutureBuilder<Weather>(
                      future: _future,
                      builder: (context, snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snap.hasError) {
                          return _ErrorState(
                            message: snap.error.toString(),
                            onRetry: _search,
                          );
                        }
                        final w = snap.data!;
                        return _WeatherView(weather: w);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Decorative city label (optional, top-right)
          Positioned(
            top: topPadding + 8,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _cityCtrl.text.isEmpty ? defaultCity : _cityCtrl.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeatherView extends StatelessWidget {
  const _WeatherView({required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.white;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),

          // Icon + Temp
          Image.network(
            weather.iconUrl,
            width: 160,
            height: 160,
          ),
          const SizedBox(height: 8),
          Text(
            "${weather.tempC.toStringAsFixed(1)}°C",
            style: TextStyle(
              color: textColor,
              fontSize: 56,
              fontWeight: FontWeight.w600,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _titleCase(weather.description),
            style: TextStyle(
              color: textColor.withOpacity(0.95),
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "${weather.city}, ${weather.country}",
            style: TextStyle(
              color: textColor.withOpacity(0.9),
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 24),

          // Stats cards
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _StatCard(
                title: "Humidity",
                value: "${weather.humidity}%",
                icon: Icons.water_drop,
              ),
              _StatCard(
                title: "Wind",
                value: "${weather.windMs.toStringAsFixed(1)} m/s",
                icon: Icons.air,
              ),
            ],
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  static String _titleCase(String s) {
    if (s.isEmpty) return s;
    return s.split(' ').map((w) {
      if (w.isEmpty) return w;
      return w[0].toUpperCase() + w.substring(1);
    }).join(' ');
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final clean = message.replaceAll(RegExp(r'Exception:\s*'), '');
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 56, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            clean,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: onRetry,
            child: const Text("Try Again"),
          ),
        ],
      ),
    );
  }
}
