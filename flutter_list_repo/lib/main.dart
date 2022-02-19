import 'package:flutter/material.dart';
import 'package:flutter_list_repo/BaseClass.dart';
import 'package:flutter_list_repo/DatePickerScreen.dart';
import 'package:flutter_list_repo/FontsScreen.dart';
import 'package:flutter_list_repo/UserPreferences.dart';
import 'package:flutter_list_repo/loadJsonScreen.dart';
import 'OpenCamera.dart';
import 'Maps.dart';
import 'ButtonsScreen.dart';
import 'getLocation.dart';
import 'GetResponseFromServer.dart';
import 'TabBarScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  List arrayStr = [
    'Open Cameras',
    'Google Maps',
    'Different Fonts',
    'Different Buttons',
    'User Preferences',
    'Get Current Location',
    'Offline Storage Using Shared Preferences',
    'Load Json File',
    'Get Response From Server',
    'Open Date Picker Screen',
    'Open Tab Bar Screen',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView.separated(
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: arrayStr.length,
      padding: EdgeInsets.only(top: 20),
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(arrayStr[index]),
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(
                    (context),
                    MaterialPageRoute(builder: (context) => LandingScreen()),
                  );
                  break;
                case 1:
                  Navigator.push(
                    (context),
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  );
                  break;
                case 2:
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) => FontsScreen()));
                  break;
                case 3:
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) => ButtonsScreen()));
                  break;
                case 4:
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => UserPreferenceExample()));
                  break;
                case 5:
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => LocationScreen()));
                  break;
                case 7:
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => const loadJsonScreen()));
                  break;
                case 8:
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => const getResponseFromServer()));
                  break;
                case 9:
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => const DatePickerScreen()));
                  break;
                case 10:
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => const TabBarScreen()));
                  break;
              }
            });
      },
      scrollDirection: Axis.vertical,
    )));
  }
}
