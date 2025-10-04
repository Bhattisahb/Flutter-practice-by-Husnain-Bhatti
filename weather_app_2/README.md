# Weather App 2

A beautiful and feature-rich weather application built with Flutter as part of the Flutter practice collection by Husnain Bhatti.

## Features

🌤️ **Current Weather**: Get real-time weather information
🔍 **City Search**: Search weather for any city worldwide
📍 **Location-based**: Automatic weather for your current location
🎨 **Dynamic Themes**: UI changes based on time of day
📱 **Material 3 Design**: Modern and clean user interface
☀️ **Detailed Information**: Temperature, humidity, wind speed, pressure, and more
🌅 **Sunrise/Sunset**: View sunrise and sunset times

## Screenshots

*Add screenshots here*

## Dependencies

- `http: ^1.2.2` - For API calls
- `geolocator: ^12.0.0` - For location services
- `permission_handler: ^11.3.1` - For handling permissions
- `intl: ^0.19.0` - For date/time formatting

## Setup

1. Clone the repository
2. Navigate to the weather_app_2 directory
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## API Configuration

To use real weather data, you'll need to:

1. Get a free API key from [OpenWeatherMap](https://openweathermap.org/api)
2. Replace `YOUR_API_KEY` in `lib/services/weather_service.dart` with your actual API key

## Demo Mode

The app includes mock data for demonstration purposes when no API key is configured.

## Architecture

```
lib/
├── main.dart              # App entry point
├── models/
│   └── weather.dart       # Weather data model
├── services/
│   └── weather_service.dart # Weather API service
└── screens/
    ├── weather_screen.dart  # Main weather screen
    └── about_screen.dart    # About/info screen
```

## Permissions

### Android
- `INTERNET` - For API calls
- `ACCESS_FINE_LOCATION` - For precise location
- `ACCESS_COARSE_LOCATION` - For approximate location

### iOS
Location permissions are handled automatically by the geolocator plugin.

## Contributing

This is part of a Flutter practice collection. Feel free to fork and experiment!

## Developer

**Husnain Bhatti**  
Flutter Practice Collection

## License

This project is for educational purposes.
