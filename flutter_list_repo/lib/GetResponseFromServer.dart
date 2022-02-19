import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:io';

class getResponseFromServer extends StatefulWidget {
  const getResponseFromServer({Key key}) : super(key: key);

  @override
  _getResponseFromServerState createState() => _getResponseFromServerState();
}

class _getResponseFromServerState extends State<getResponseFromServer> {
  TextEditingController _urlController;
  TextEditingController _apiTokenController;
  String _responseBody = '<empty>';
  String _error = '<none>';
  bool _pending = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._apiTokenController = TextEditingController();
    this._urlController = TextEditingController()
      //this value will be initialized to the previous line.
      ..text = "https://jsonplaceholder.typicode.com/posts/1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Json Screen From Server')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: this._urlController,
            decoration: InputDecoration(
              labelText: 'URL to get',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: this._apiTokenController,
            decoration: InputDecoration(
              labelText: 'Optional api token',
              border: OutlineInputBorder(),
            ),
          ),
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: _pending
                    ? null
                    : () => this._httpGet(
                        _urlController.text, _apiTokenController.text),
                child: Text('Get'),
              ),
              ElevatedButton(
                onPressed: this._reset,
                child: Text('Reset'),
              )
            ],
          ),
          Text('Response body = $_responseBody'),
          Divider(),
          Text('Error = $_error'),
        ],
      ),
    );
  }

  void _reset({bool resetControllers = true}) {
    setState(() {
      if (resetControllers) {
        this._urlController.text = "";
      }
      this._responseBody = '<empty>';
      this._error = '<none>';
      this._pending = false;
    });
  }

  Future<void> _httpGet(String url, String apiToken) async {
    _reset();
    setState(() {
      this._pending = true;
    });
    try {
      final http.Response response = await http.get(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: apiToken});
      final parsed = await compute(jsonDecode, response.body);
      print('parsed json object = $parsed');
      setState(() => this._responseBody = response.body);
    } catch (error) {
      setState(() {
        this._error = error;
      });
      setState(() => this._pending = false);
      this._reset();
    }
  }
}
