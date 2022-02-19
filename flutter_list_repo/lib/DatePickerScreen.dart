import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({Key key}) : super(key: key);

  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Screen'),
      ),
      body: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.dateAndTime,
        initialDateTime: DateTime(1969, 1, 1, 11, 33),
        onDateTimeChanged: (DateTime newDateTime) {
          //Do Some thing
        },
        use24hFormat: false,
        minuteInterval: 1,
      ),
    );
  }
}
