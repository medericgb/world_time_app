import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name for ui
  String time; // The time in that location
  String flag; // Url to an asset flag icon
  String url; // Location endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      Response resp = await get('http://worldtimeapi.org/api/timezone/$url');
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

      // Set time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
    }
  }
}
