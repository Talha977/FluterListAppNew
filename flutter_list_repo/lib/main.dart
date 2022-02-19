import 'package:flutter/material.dart';
import 'package:flutter_list_repo/Screens/BaseClass.dart';
import 'package:flutter_list_repo/Screens/DatePickerScreen.dart';
import 'package:flutter_list_repo/Screens/FontsScreen.dart';
import 'package:flutter_list_repo/Screens/UserPreferences.dart';
import 'package:flutter_list_repo/Screens/loadJsonScreen.dart';
import 'package:flutter_list_repo/Screens/OpenCamera.dart';
import 'package:flutter_list_repo/Screens/Maps.dart';
import 'package:flutter_list_repo/Screens/ButtonsScreen.dart';
import 'package:flutter_list_repo/Screens/getLocation.dart';
import 'package:flutter_list_repo/Screens/GetResponseFromServer.dart';
import 'package:flutter_list_repo/Screens/TabBarScreen.dart';
import 'package:flutter_list_repo/Delegates/CustomSearchDelegate.dart';
import 'package:flutter_list_repo/Widgets/screen_select.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  List<String> arrayStr = [
    'Open Camera',
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
        appBar: AppBar(
          title: const Text('Search'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(listItems: arrayStr),
                );
              },
            )
          ],
        ),
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
                  onTapMainScreen(context, index);
                });
          },
          scrollDirection: Axis.vertical,
        )));
  }
}
