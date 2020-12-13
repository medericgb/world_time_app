import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // Make the request
    Response resp =
        await get('http://worldtimeapi.org/api/timezone/Europe/London');
    Map data = convert.jsonDecode(resp.body);
    // print(data);

    // Get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    // print(datetime);
    // print(offset);

    // Create Datetime object
    DateTime now = DateTime.parse(datetime);
    now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
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
