import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = "https://jsonplaceholder.typicode.com/posts";
  var _posts = [];

  void getdata() async {
    try {
      var res = await get(Uri.parse(url));
      final jsonData = jsonDecode(res.body) as List;

      setState(() {
        _posts = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("HTTP Get"),
          ),
          body: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, i) {
                final post = _posts[i];
                // return Text("Title: ${post["title"]}");
                return Card(
                  child: ListTile(
                    title: Text("Title: ${post["title"]}"),
                  ),
                );
              })),
    );
  }
}
