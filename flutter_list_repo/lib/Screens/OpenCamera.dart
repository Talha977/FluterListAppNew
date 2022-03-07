import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// void main(List<String> args) {
//   runApp(new MaterialApp(
//     title: 'Camera Screen',
//     home: LandingScreen(),
//   ));
// }

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String _path = null;

  _openGallery() async {
    final picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      _path = picture.path;
    });
  }

  _openCamera() async {
    final picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      _path = picture.path;
    });
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make A Choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  kIsWeb == true
                      ? GestureDetector(
                          onTap: () async {
                            // _openGallery();
                            print("File selected from web");
                            // Navigator.of(context).pop();
                          },
                          child: Text('Select Image From Folder(Unavailable)'),
                        )
                      : GestureDetector(
                          onTap: () async {
                            _openGallery();
                            // Navigator.of(context).pop();
                          },
                          child: Text('Gallery')),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                      onTap: () async {
                        _openCamera();
                        // Navigator.of(context).pop();
                      },
                      child: Text('Open Camera'))
                ],
              ),
            ),
          );
        });
  }

  /// this function backs the Screen
  void _onTapBackButton() => Navigator.of(context).pop();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(5),
          children: [
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 4'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
          title: Row(children: <Widget>[
        IconButton(
          onPressed: _onTapBackButton,
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ])),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // imageFile.path.isEmpty == false
            //     ? Image(image: new AssetImage(imageFile.path))
            //     : (Text('No Image')),
            // Text('No Image Selected'),
            RaisedButton(
              onPressed: () {
                _showChoiceDialog(context);
              },
              child: Text('Select Image'),
            ),
            _path == null ? Placeholder() : Image.file(File(_path)),
          ],
        ),
      )),
    );
  }
}
