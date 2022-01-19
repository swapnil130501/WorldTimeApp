import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime obj = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await obj.getTime();
    Navigator.pushReplacementNamed(context,'/home', arguments: {
      'location': obj.location,
      'flag': obj.flag,
      'time': obj.time,
      'isDaytime':obj.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
       child: SpinKitRing(
        color: Colors.white,
        size: 50.0,
       ),
      ),
    );
  }
}

