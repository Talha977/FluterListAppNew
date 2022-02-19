import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  final _kTabPages = <Widget>[
    Center(child: Icon(Icons.cloud)),
    Center(child: Icon(Icons.cabin)),
    Center(child: Icon(Icons.car_rental)),
  ];

  final _kTabs = <Tab>[
    Tab(icon: Icon(Icons.cloud), text: 'Tab 1'),
    Tab(icon: Icon(Icons.account_tree), text: 'Tab 2'),
    Tab(icon: Icon(Icons.tag_sharp), text: 'Tab 3'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab Bar Screen'),
            bottom: TabBar(tabs: _kTabs),
          ),
          body: TabBarView(
            children: _kTabs,
          ),
          // bottomSheet: TabBar(tabs: _kTabs),
          bottomNavigationBar: Container(
            child: TabBar(tabs: _kTabs),
            color: Color(0xFF3F5AA6),
          )),
    );
  }
}
