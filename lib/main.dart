import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/services/networking.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget homeWidget = HomeScreen();
  @override
  Widget build(BuildContext context) {
    this._getCurrentLocationWeather(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: homeWidget,
    );
  }

  void _getCurrentLocationWeather(BuildContext context) async {
    Map map = await Networking.getCurrentLocationWeather();
    setState(() {
      this.homeWidget = WeatherScreen(
        weather: map['weather'],
        weathers: map['weathers'],
        location: map['location'],
      );
    });
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SplashScreen(
          imageBackground: Image.asset(
            'assets/images/weather.jpg',
            fit: BoxFit.cover,
          ).image,
          seconds: 14,
          title: Text('Welcome In Weather'),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: TextStyle(),
          photoSize: 100.0,
          loaderColor: Colors.red),
    );
  }
}

// seconds: 14,
// navigateAfterSeconds: new AfterSplash(),
// title: new Text('Welcome In SplashScreen'),
// image: new Image.asset('screenshot.png'),
// backgroundColor: Colors.white,
// styleTextUnderTheLoader: new TextStyle(),
// photoSize: 100.0,
// loaderColor: Colors.red
// );
