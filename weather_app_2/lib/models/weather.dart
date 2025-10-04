class Weather {
  final String cityName;
  final double temperature;
  final String condition;
  final String description;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final double visibility;
  final int cloudiness;
  final DateTime sunrise;
  final DateTime sunset;
  final String country;
  final String icon;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.description,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.visibility,
    required this.cloudiness,
    required this.sunrise,
    required this.sunset,
    required this.country,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] ?? '',
      temperature: (json['main']['temp'] as num).toDouble(),
      condition: json['weather'][0]['main'] ?? '',
      description: json['weather'][0]['description'] ?? '',
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      humidity: json['main']['humidity'] ?? 0,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      pressure: json['main']['pressure'] ?? 0,
      visibility: (json['visibility'] as num?)?.toDouble() ?? 0.0,
      cloudiness: json['clouds']['all'] ?? 0,
      sunrise: DateTime.fromMillisecondsSinceEpoch(
        (json['sys']['sunrise'] as int) * 1000,
      ),
      sunset: DateTime.fromMillisecondsSinceEpoch(
        (json['sys']['sunset'] as int) * 1000,
      ),
      country: json['sys']['country'] ?? '',
      icon: json['weather'][0]['icon'] ?? '',
    );
  }

  String get weatherIconUrl => 'https://openweathermap.org/img/wn/$icon@2x.png';

  String get temperatureString => '${temperature.round()}°';

  String get feelsLikeString => '${feelsLike.round()}°';
}
