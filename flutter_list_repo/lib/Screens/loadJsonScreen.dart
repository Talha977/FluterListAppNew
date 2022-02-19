import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'imageModel.dart';

class loadJsonScreen extends StatefulWidget {
  const loadJsonScreen({Key key}) : super(key: key);

  @override
  _loadJsonScreenState createState() => _loadJsonScreenState();
}

class _loadJsonScreenState extends State<loadJsonScreen> {
  List<imageObj> imageList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var jsonData = await rootBundle.loadString("assets/Random-Images.json");
    final decodedData = jsonDecode(jsonData);
    var sampleData = decodedData["sample"];
    imageList =
        List.from(sampleData).map((obj) => imageObj.fromMap(obj)).toList();
    setState(() {
      // print("image List is found to be $imageList");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Json Objects'),
        ),
        body: Container(
            child: imageList.isEmpty
                ? Text('No Objects Found')
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: imageList.length,
                    padding: EdgeInsets.only(top: 20),
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(imageList[index].description),
                          onTap: () {
                            print("index is $index");
                          });
                    },
                    scrollDirection: Axis.vertical,
                  )));
  }
}
