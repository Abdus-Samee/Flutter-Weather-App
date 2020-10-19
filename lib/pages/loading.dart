import 'package:flutter/material.dart';
import 'package:myflutterapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async{
    WorldTime o = WorldTime('Chittagong');
    await o.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': o.city,
      'temp': o.temp,
      'daytime': o.daytime,
      'condition': o.condition,
      'img': o.img
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[900],
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
