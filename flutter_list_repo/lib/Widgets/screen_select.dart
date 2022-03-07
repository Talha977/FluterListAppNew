import 'package:flutter/material.dart';
import 'package:flutter_list_repo/Screens/BaseClass.dart';
import 'package:flutter_list_repo/Screens/DataTableScreen.dart';
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
import 'package:flutter_list_repo/Screens/notificationsScreen.dart';

void onTapMainScreen(BuildContext context, int index) {
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
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => FontsScreen()));
      break;
    case 3:
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => ButtonsScreen()));
      break;
    case 4:
      Navigator.push((context),
          MaterialPageRoute(builder: (context) => UserPreferenceExample()));
      break;
    case 5:
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => LocationScreen()));
      break;
    case 7:
      Navigator.push((context),
          MaterialPageRoute(builder: (context) => const loadJsonScreen()));
      break;
    case 8:
      Navigator.push(
          (context),
          MaterialPageRoute(
              builder: (context) => const getResponseFromServer()));
      break;
    case 9:
      Navigator.push((context),
          MaterialPageRoute(builder: (context) => const DatePickerScreen()));
      break;
    case 10:
      Navigator.push((context),
          MaterialPageRoute(builder: (context) => const TabBarScreen()));
      break;
    case 11:
      Navigator.push((context),
          MaterialPageRoute(builder: (context) => const Notificationsscreen()));
      // print('To add Notification Screen');
      break;
    case 12:
      Navigator.push((context),
          MaterialPageRoute(builder: (context) => const Datatablescreen()));
  }
}
