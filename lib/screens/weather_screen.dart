import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/widgets/header1.dart';
import 'package:weather_app/widgets/header2.dart';
import 'package:weather_app/widgets/header3.dart';

class WeatherScreen extends StatelessWidget {
  final Weather weather;
  final List<Weather> weathers;
  final Location location;

  WeatherScreen({this.weather, this.weathers, this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepPurple,
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(0.0),
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Header1(
                      text: location.city,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Image(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                    image: Svg('assets/images/selected icon/wi-alien.svg'),
                  ),
                  Header1(
                    text: weather.main,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        columnWidget(
                            label: 'temperature',
                            text: weather.temperature.toString()),
                        columnWidget(
                            label: 'humidity',
                            text: weather.humidity.toString()),
                        columnWidget(
                            label: 'wind speed', text: weather.wind.toString()),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0, bottom: 0.0),
                    padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        rowWidget(start: 1),
                        rowWidget(start: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column columnWidget({String label, String text}) {
    return Column(
      children: [
        textWidget(text: label),
        textWidget(text: text),
      ],
    );
  }

  Row rowWidget({int start}) {
    print(weathers[start].dateTime.weekday);
    print(weathers[start].dateTime.day);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        dayWidget(
            label: weathers[start].main,
            text: '${weathers[start].temperature} C',
            day: kDayNames[weathers[start].dateTime.weekday - 1]),
        dayWidget(
            label: weathers[start + 1].main,
            text: '${weathers[start + 1].temperature} C',
            day: kDayNames[weathers[start + 1].dateTime.weekday - 1]),
        dayWidget(
            label: weathers[start + 2].main,
            text: '${weathers[start + 2].temperature} C',
            day: kDayNames[weathers[start + 2].dateTime.weekday - 1]),
      ],
    );
  }

  Widget textWidget({String text}) {
    return Header3(
      text: text,
      color: Colors.black54,
    );
  }

  Widget dayWidget({String label, String text, String day}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.deepPurple[700],
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/clouds.png',
              width: 50,
              height: 50,
            ),
            Header2(
              text: day,
            ),
            Header3(
              text: label,
            ),
            Header3(
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}

const kDayNames = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];

// Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: Header1(
//                     text: location.city,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Image.asset(
//                   'assets/images/clouds.png',
//                   height: 100.0,
//                   width: 100.0,
//                   fit: BoxFit.contain,
//                 ),
//                 Header1(
//                   text: weather.main,
//                   color: Colors.black54,
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     columnWidget(
//                         label: 'temp', text: weather.temperature.toString()),
//                     columnWidget(
//                         label: 'humid', text: weather.humidity.toString()),
//                     columnWidget(label: 'wind', text: weather.wind.toString()),
//                   ],
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     margin: EdgeInsets.only(top: 10.0),
//                     padding: EdgeInsets.only(top: 20.0),
//                     decoration: BoxDecoration(
//                       color: Colors.deepPurple,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(25.0),
//                         topRight: Radius.circular(25.0),
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         rowWidget(),
//                         rowWidget(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
