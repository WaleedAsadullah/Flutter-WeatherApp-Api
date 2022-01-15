import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weatherapp/model/home_model.dart';

getdata(String cityname ) async {
  var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=f5783e1fee68d6228723ecc46804ee40'));
  var jsonData = jsonDecode(response.body);
  // print(jsonData);
  // List<HomeModel> users = [];
  HomeModel user = HomeModel(
      city: jsonData['name'],
      humidity: jsonData['main']['humidity'],
      pressure: jsonData['main']['pressure'],
      status: jsonData['weather'][0]['main'],
      temperature: jsonData['main']['temp'],
      wind: jsonData['wind']['speed'],
      currentdate : jsonData['dt'],
      sunrise : jsonData['sys']['sunrise'],
      sunset : jsonData['sys']['sunset']);
  // users.add(user);
  // print(users);
  return user;
}
