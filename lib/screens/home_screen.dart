import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/widgets/header1.dart';
import 'package:weather_app/widgets/my_bottom_sheet.dart';
import 'package:weather_app/widgets/rounded_button.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepPurple,
        child: SafeArea(
          child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                    child: Header1(
                      text: 'Daily',
                      color: Color(0xc04f4f4f),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.only(top: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Header1(
                              text: 'weather',
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            RoundedButton(
                              label: 'Get by City',
                              onPress: () => this._showDialog(context),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            RoundedButton(
                              label: 'Get Location',
                              onPress: () {
                                print('get location clicked');
                              },
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            RoundedButton(
                              label: 'Current Location',
                              onPress: () {
                                print('processing....');
                                this._onCurrentLocationPressed(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    this._scaffoldKey.currentState.showBottomSheet(
      (context) {
        return MyBottomSheet(
          controller: this._textEditingController,
        );
      },
      backgroundColor: Colors.transparent,
    );
  }

  void _onCurrentLocationPressed(BuildContext context) async {
    Map map = await Networking.getCurrentLocationWeather();
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => WeatherScreen(
          weather: map['weather'],
          weathers: map['weathers'],
          location: map['location'],
        ),
      ),
    );
  }
}

//Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(left: 16.0, top: 10.0),
//                   child: Header1(
//                     text: 'Daily',
//                     color: Color(0xc04f4f4f),
//                   ),
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
//                     child: SingleChildScrollView(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Header1(
//                             text: 'weather',
//                             color: Colors.white,
//                           ),
//                           SizedBox(
//                             height: 30.0,
//                           ),
//                           RoundedButton(
//                             label: 'Get by City',
//                             onPress: () => this._showDialog(context),
//                           ),
//                           SizedBox(
//                             height: 40.0,
//                           ),
//                           RoundedButton(
//                             label: 'Get Location',
//                             onPress: () {
//                               print('get location clicked');
//                             },
//                           ),
//                           SizedBox(
//                             height: 40.0,
//                           ),
//                           RoundedButton(
//                             label: 'Current Location',
//                             onPress: () {
//                               print('processing....');
//                               this._onCurrentLocationPressed(context);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
