import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/rocketInfoModle.dart';

Future<List<dynamic>> getAllRocketsList() async {
  var _uri = Uri.parse("https://api.spacexdata.com/v4/rockets");
  try {
    var _response = await http.get(_uri);
    if (_response.statusCode == 200) {
      var list = jsonDecode(_response.body);
      return list.map((order) => RocketInfoModel.fromJson(order)).toList();
    }
  } catch (error) {
    print(error);
  }
  return [];
}

Future<dynamic> getInfoById(String Id) async {
  try {
    var _uri = Uri.parse("https://api.spacexdata.com/v4/rockets/$Id");
    var _response = await http.get(_uri);
    if (_response.statusCode == 200) {
      return RocketInfoModel.fromJson(json.decode(_response.body.toString()));
    }
  } catch (error) {
    print(error);
  }
}
