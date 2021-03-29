import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String _imageUrl = "";
  bool _isloaded = false;

  Future<void> getdata() async {
    var url =
        'https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=Lq71D5DXPohbh5gwlEr11OK9aAxBaA6P#';
    final response = await http.get(url);
    final loadedData = json.decode(response.body);
    var result = loadedData['results'] as List<dynamic>;
    var imageUrl = result[0]['media'][0]['media-metadata'][0]['url'];
    _imageUrl = imageUrl;
    print(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Text(
              _imageUrl,
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.grey,
            child: FlatButton(onPressed: getdata, child: Text('Press')),
          )
        ],
      ),
    );
  }
}
