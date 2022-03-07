import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    title: 'Camera Screen',
    home: const UserPreferenceExample(),
  ));
}

class UserPreferenceExample extends StatefulWidget {
  const UserPreferenceExample({Key key}) : super(key: key);

  @override
  _UserPreferenceExampleState createState() => _UserPreferenceExampleState();
}

class _UserPreferenceExampleState extends State<UserPreferenceExample> {
  // void initState() {
  // super.initState();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    // set your stuff here
    SharedPreferences sf = await SharedPreferences.getInstance();
    var tempString = sf.getString("string");
    print("USERDEFAULTS = $tempString");
    strTextField = tempString;
    setState(() {
      getDynamicSF("string").then((value) {
        strTextField =
            getDynamicSF("string") ?? "No String Found from Shared Preference.";
      });
    });
  }

  // }

  String strTextField = 'No text';
  setStringToSF(String str) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString("string", str);
    print("String is found to be $str");
  }

  setIntToSF(int num) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setInt("int", num);
  }

  setBoolToSF(bool boolVal) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setBool("Bool", boolVal);
  }

  Future<dynamic> getDynamicSF(String key) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    dynamic tempVar = sf.get(key);
    return tempVar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shared Preferences Screen'),
        ),
        body: TextField(
            decoration: new InputDecoration(
                labelText: strTextField, hintText: "Please enter String"),
            onChanged: setStringToSF));
  }
}
