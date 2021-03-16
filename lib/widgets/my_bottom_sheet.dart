import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/weather_screen.dart';

import 'header2.dart';

class MyBottomSheet extends StatelessWidget {
  final TextEditingController controller;

  MyBottomSheet({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Header2(
                text: 'Get Weather By City Name',
                color: Colors.deepPurpleAccent),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: TextField(
              style: TextStyle(
                color: Colors.deepPurple,
              ),
              controller: this.controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(width: 2.0, color: Colors.blueAccent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(width: 1.0, color: Colors.blueAccent),
                ),
                hintText: 'enter city name',
                hintStyle: TextStyle(
                  color: Color(0x9d7a43AA),
                ),
                prefixIcon: Icon(
                  Icons.location_on,
                  size: 20.0,
                  color: Colors.deepPurpleAccent,
                ),
                labelText: 'enter city name',
                labelStyle: TextStyle(
                  color: Color(0x9d7a43AA),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: OutlineButton(
              onPressed: () => this._onGetWeatherTab(context),
              child: Header2(
                text: 'Get Weather',
                color: Colors.blueAccent,
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              borderSide: BorderSide(
                width: 3.0,
                color: Colors.deepPurple,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onGetWeatherTab(BuildContext context) async {
    String cityName = this.controller.text.trim();
    if (cityName.isNotEmpty) {
      Weather weather = await this._getWeather(cityName);
      if (weather != null) {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => WeatherScreen(
              weather: weather,
            ),
          ),
        );
      } else {
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: 'unknown city',
            webPosition: 1,
            toastLength: Toast.LENGTH_LONG);
      }
    } else {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: 'city name not specified!',
          webPosition: 1,
          toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<Weather> _getWeather(String cityName) async {
    // return await Networking.getWeatherByCity(cityName);
  }
}
