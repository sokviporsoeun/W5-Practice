import 'package:flutter/material.dart';

//Data Models
enum WeatherType {
  cloudy(
    'cloudy',
    Colors.white,
    'assets/cloudy.png', 
  ),
  sunny(
    'sunny',
    Colors.yellow,
    'assets/sunny.png', 
  ),
  sunnyCloudy(
    'sunnyCloudy',
    Colors.yellow,
    'assets/sunnyCloudy.png',
  ),
  veryCloudy(
    'veryCloudy',
    Colors.white,
    'assets/veryCloudy.png',
  );

  final String name;
  final Color color;
  final String imagePath;
  const WeatherType(this.name, this.color, this.imagePath);
}

class CityWeather {
  final String city;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final WeatherType weatherType;
  final List<Color> cardGradient;

  const CityWeather({
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.weatherType,
    required this.cardGradient,
  });
}

//Data list 
const List<CityWeather> cityWeatherList = [
  CityWeather(
    city: 'Phnom Penh',
    minTemp: 18.0,
    maxTemp: 32.0,
    currentTemp: 12.2,
    weatherType: WeatherType.cloudy,
    cardGradient: [Color(0xFF8E2DE2), Color(0xFF4A00E0)], // 
  ),
  CityWeather(
    city: 'Paris',
    minTemp: 10.0,
    maxTemp: 45.0,
    currentTemp: 22.2,
    weatherType: WeatherType.sunnyCloudy,
    cardGradient: [Color(0xFF6dd5ed), Color(0xFF2193b0)], 
  ),
  CityWeather(
    city: 'Rome',
    minTemp: 10.0,
    maxTemp: 45.0,
    currentTemp: 45.2,
    weatherType: WeatherType.sunny,
    cardGradient: [Color(0xFFf09819), Color(0xFFff5858)], 
  ),
  CityWeather(
    city: 'Toulouse',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    weatherType: WeatherType.veryCloudy,
    cardGradient: [Color(0xFFF7971E), Color(0xFFFFD200)], 
  ),
];
//Widget Implementatioon
class WeatherCard extends StatelessWidget {
  final CityWeather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    // Uses PhysicalModel 
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 6.0,
      shadowColor: Colors.black54,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          // Uses gradient background
          gradient: LinearGradient(
            colors: weather.cardGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // Uses Stack for the optional decorative oval
        child: Stack(
          children: [
            // Decorative oval (Positioned element)
            Positioned(
              right: -50,
              top: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Card Content layout (Row/Columns)
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: Image.asset(
                          weather.weatherType.imagePath,
                          width: 30,
                          height: 30,
                          color: weather.weatherType.color == Colors.white
                              ? Colors.white
                              : null,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weather.city,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Min ${weather.minTemp}°C',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            'Max ${weather.maxTemp}°C',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
      
                  Text(
                    '${weather.currentTemp}°C',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The weather Forecast'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      // Use Column to contain the Expanded widget
      body: Column(
        children: [
          // Expanded ensures the ListView takes up the remaining vertical space
          Expanded( 
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
              // ListView.builder provides the scrollable view
              child: ListView.builder(
                itemCount: cityWeatherList.length,
                itemBuilder: (context, index) {
                  return WeatherCard(weather: cityWeatherList[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

void main() {
  runApp(const MyApp());
}