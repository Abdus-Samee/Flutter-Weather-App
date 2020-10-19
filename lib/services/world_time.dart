import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String city;
  String daytime;
  String temp;
  String condition;
  String img = "http:";

  WorldTime(city){
    this.city = city;
  }

  Future<void> getTime() async {
    try {
      Response response  = await get('http://api.weatherapi.com/v1/current.json?key=8e5c6dd063224475b71155713201810&q=$city');
      Map weather = jsonDecode(response.body);
      this.daytime = weather['current']['is_day'].toString();
      this.temp = weather['current']['temp_c'].toString();
      this.condition = weather['current']['condition']['text'].toString();
      this.img += weather['current']['condition']['icon'].toString();
    }catch (e) {
      print('Caught error: $e');
    }
  }
}