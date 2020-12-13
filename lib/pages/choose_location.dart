import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  ChooseLocation({Key key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF577590),
      appBar: AppBar(
        backgroundColor: Color(0xFF073b4c),
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Choose Location'),
      ),
    );
  }
}
