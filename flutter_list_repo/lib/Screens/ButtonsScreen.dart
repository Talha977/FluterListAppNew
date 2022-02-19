import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({Key key}) : super(key: key);

  @override
  _ButtonsScreenState createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  var _isAcUnitSelected = false;
  var _isAlarmSelected = false;
  static const menuItems = <String>['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  var _dropdownValue = "Item 1";
  var _checkboxVal = true;
  var _switchVal = true;
  var _sliderVal = 0.5;
  int _radioVal = 0;
  final List<DropdownMenuItem<String>> _dropdownMenuItems = menuItems
      .map((String value) => DropdownMenuItem(
            child: Text(value),
            value: value,
          ))
      .toList();
  Widget build(BuildContext context) {
    _showToast() {
      Fluttertoast.showToast(
          msg: 'This is a toast!', toastLength: Toast.LENGTH_LONG);
    }

    final _showSnack = () => Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Button Tapped'), duration: Duration(milliseconds: 200)));

    return Scaffold(
      appBar: AppBar(title: Text('Buttons Screen')),
      body: ListView(
        children: [
          RaisedButton(
              child: Text('Raised Button Show Toast'), onPressed: _showToast),
          RaisedButton(
              child: Text('Raised Button  Show Snack Bar'),
              onPressed: _showSnack),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              primary: Colors.purple,
              // padding: const EdgeInsets.only(top: 5.0),
            ),
            onPressed: null,
            child: Text('Disabled'),
          ),
          FlatButton(
            child: Text(
              'Flat Button LogIn',
              style: TextStyle(fontSize: 20.0),
            ),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone),
            tooltip: "Make A Video Call",
          ),
          OutlineButton(
            onPressed: () {},
            child: Text('Outline Button'),
          ),
          Center(
              child: Text(
                  'Whenever you want to disable a button just pass null on param "onPressed" ')),
          SizedBox(
            height: 100,
          ),
          Center(
              child: Text(
            'Toggle Buttons',
            style: TextStyle(fontSize: 35),
          )),
          Divider(),
          Center(
            child: ToggleButtons(
              children: [Icon(Icons.ac_unit), Icon(Icons.alarm)],
              isSelected: [_isAcUnitSelected, _isAlarmSelected],
              onPressed: (int ind) {
                setState(() {
                  if (ind == 0) {
                    _isAcUnitSelected = !_isAcUnitSelected;
                  } else {
                    _isAlarmSelected = !_isAlarmSelected;
                  }
                });
              },
            ),
          ),
          Divider(),
          Center(
              child: Text(
            'DropDown Buttons',
            style: TextStyle(fontSize: 35),
          )),
          ListTile(
            title: Text('DropDown Button'),
            trailing: DropdownButton(
              value: _dropdownValue,
              items: _dropdownMenuItems,
              onChanged: (String value) {
                setState(() {
                  _dropdownValue = value;
                });
              },
            ),
          ),
          Divider(),
          Center(
            child: Row(
              children: [
                Text('CheckBox'),
                Checkbox(
                    value: _checkboxVal,
                    onChanged: (bool value) {
                      if (value != null) {
                        setState(() {
                          _checkboxVal = value;
                        });
                      }
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
