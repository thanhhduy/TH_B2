import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather.dart';

const baseUrl = 'https://www.metaweather.com';
Uri locationUrl(String city) => Uri.parse('$baseUrl/api/location/search/?query=$city');
Uri weatherUrl(int locationId) => Uri.parse('$baseUrl/api/location/$locationId');

//Uri được sử dụng để xác định các loại địa chỉ như URL và URN
class WeatherRepository {
  final http.Client httpClient;
  //constructor
  WeatherRepository({required this.httpClient}); //: assert(httpClient != null) remove comparision
  Future<int> getLocationIdFromCity(String city) async {
    final response = await httpClient.get(locationUrl(city));
    if(response.statusCode == 200) {
      final cities = jsonDecode(response.body) as List;
      return (cities.first)['woeid'] ?? {}; //convert Map
    } else {
      throw Exception('Error getting location id of : $city');
    }
  }
  //LocationId => Weather
  Future<Weather> fetchWeather(int locationId) async {
    final response = await httpClient.get(weatherUrl(locationId));
    if(response.statusCode != 200) {
      throw Exception('Error getting weather from locationId: $locationId');
    }
    final weatherJson = jsonDecode(response.body);
    return Weather.fromJson(weatherJson);
  }
  Future<Weather> getWeatherFromCity(String city) async {
    final int locationId = await getLocationIdFromCity(city);
    return fetchWeather(locationId);
  }
}