import 'package:flutter/material.dart';

class imageObj {
  // Sample Json
  //  {
  //   "description":"Lady with a red umbrella",
  //   "image-url":"https://i.imgur.com/pwpWaWu.jpg"
  // }
  final String description;
  final String image_url;

  imageObj({this.description, this.image_url});

  // For decoding

  factory imageObj.fromMap(Map<String, dynamic> map) {
    return imageObj(
        description: map["description"], image_url: map["image_url"]);
  }

  // For Encoding

  toMap() => {"description": description, "image_url": image_url};
}
