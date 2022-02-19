import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';



class SharedPreferenceExample extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SharedPreferenceExample> {
    // const SharedPreferenceExample({Key key}):super(key: key);
  SharedPreferences preferences;
  final String title = "";
  int _counter = 0;
  void initState() { 
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
  Future<void> initializePreference() async { 
    // to initialize Shared preferences.
    this.preferences = await SharedPreferences.getInstance();
  }
}
