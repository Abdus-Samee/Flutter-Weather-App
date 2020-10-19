import 'package:flutter/material.dart';
import 'package:myflutterapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  String city = "";

  List<WorldTime> locations = [
    WorldTime('Dhaka'),
    WorldTime('Istanbul'),
    WorldTime('Tokyo'),
    WorldTime('Seoul'),
    WorldTime('Stockholm'),
    WorldTime('London'),
  ];

  void updateTime(String str) async{
    WorldTime o = new WorldTime(str);
    await o.getTime();
    Navigator.pop(context, {
      'location': o.city,
      'temp': o.temp,
      'daytime': o.daytime,
      'condition': o.condition,
      'img': o.img
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter a city name..."
                ),
                onChanged: (String str){
                  setState(() {
                    city = str;
                  });
                },
              ),
              FlatButton.icon(
                  onPressed: (){
                    updateTime(city);
                  },
                  icon: Icon(Icons.edit),
                  label: Text('GO!')
              )
            ],
          ),
        ),
      ),
    );
  }
}