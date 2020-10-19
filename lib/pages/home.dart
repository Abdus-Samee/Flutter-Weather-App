import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;

    String bgImg = data['daytime'] == '1' ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'temp': result['temp'],
                          'location': result['location'],
                          'daytime': result['daytime'],
                          'condition': result['condition'],
                          'img': result['img'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location')
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  data['temp'],
                  style: TextStyle(
                    fontSize: 66,
                  ),
                ),
                SizedBox(height: 20,),
                Image.network(data['img']),
                SizedBox(height: 20,),
                Text(
                  data['condition'],
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
