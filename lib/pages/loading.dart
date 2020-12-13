import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Response response =
        await get('https://jsonplaceholder.typicode.com/todos/1');
    // var jsonResponse = convert.jsonDecode(response.body);
    Map data = convert.jsonDecode(response.body);
    print(data);
    print(data["title"]);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFb08968),
      body: Center(
        child: Text('Loading Screen'),
      ),
    );
  }
}
