import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    // make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    // get properties from json
    String datetime = data['datetime'];
    String offset1 = data['utc_offset'].substring(1,3);
    String offset2 = data['utc_offset'].substring(4,6);


    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
    isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
    // set the time property
    time = DateFormat.jm().format(now);
  }

}

// WorldTime obj = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');