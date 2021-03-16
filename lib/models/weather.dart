class Weather {
  final double temperature;
  final double wind;
  final int humidity;
  final String main;
  final String description;
  final DateTime dateTime;

  Weather({
    this.temperature,
    this.wind,
    this.humidity,
    this.description,
    this.main,
    this.dateTime,
  });

  static Weather currentFromJson(Map map) {
    Weather weather = Weather(
      main: map['weather'][0]['main'],
      description: map['weather'][0]['description'],
      temperature: map['temp'],
      humidity: map['humidity'],
      wind: map['wind_speed'],
    );
    return weather;
  }

  static Weather dailyFromJson(Map map) {
    Weather weather = Weather(
      main: map['weather'][0]['main'],
      description: map['weather'][0]['description'],
      temperature: map['temp']['day'],
      humidity: map['humidity'],
      wind: map['wind_speed'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000),
    );
    return weather;
  }
}
