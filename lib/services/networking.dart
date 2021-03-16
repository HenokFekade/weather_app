import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/models/location.dart' as Model;
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/location.dart' as Service;

class Networking {
  static final String _apiKey = '242ab63f158d3e83d95f50477050ca04';
  static final String _celsius = '&units=metric';
  static final String _fahrenheit = '&units=imperial';
  static final String _url = 'http://api.openweathermap.org/data/2.5/weather?';

  static Future<Weather> getWeatherByCity(String cityName) async {
    Client client = Client();
    String url = Networking._url +
        'q=$cityName${Networking._celsius}&appid=${Networking._apiKey}';

    var response = await client.get(url);
    client.close();
    var json = jsonDecode(response.body);
    if (json['cod'] == '404') {
      return null;
    } else {
      return Weather.currentFromJson(json);
    }
  }

  static Future<Map> getCurrentLocationWeather() async {
    Model.Location location = await Networking.getLocationDetail();
    Client client = Client();
    String url = 'http://api.openweathermap.org/data/2.5/onecall?';
    url += 'lat=${location.latitude}&lon=${location.longitude}';
    url += '&exclude=minutely&units=metric&appid=${Networking._apiKey}';
    var response = await client.get(url);
    client.close();
    var json = jsonDecode(response.body);
    if (json['cod'] == '404') {
      return null;
    } else {
      Weather weather = Weather.currentFromJson(json['current']);
      List<Weather> weathers = [];
      for (Map map in json['daily']) {
        Weather weather = Weather.dailyFromJson(map);
        weathers.add(weather);
      }
      return {'weather': weather, 'weathers': weathers, 'location': location};
    }
  }

  static Future<Model.Location> getLocationDetail() async {
    Position position = await Service.Location.getCurrentLocation();
    Client client = Client();
    String url = 'https://nominatim.openstreetmap.org/reverse?format=json&';
    url +=
        'lat=${position.latitude}&lon=${position.longitude}&zoom=18&addressdetails=1';
    var response = await client.get(url);
    client.close();
    Map map = jsonDecode(response.body);
    return Model.Location.fromJson(map);
  }
}
