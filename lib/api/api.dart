import 'dart:convert';

import 'package:connect_api_sample/constString.dart';
import 'package:connect_api_sample/model/model.dart';
import 'package:http/http.dart' as http;

class Api {
  final String _url = "community-open-weather-map.p.rapidapi.com";
  final String _urlPath = "/weather";

  http.Client _client = http.Client();

  Future<Model> getWeather() async {
    Map<String, String> _headers = {
      "X-RapidAPI-Key": API_KEY,
    };

    Map<String, String> queryParameters = {
      'q': 'London,uk',
    };
    Uri _uri = Uri.https(_url, _urlPath, queryParameters);
    return _client.get(_uri, headers: _headers).then((res) {
      return  Model.fromJson(json.decode(res.body));
    }).catchError((onError) {
      throw onError;
    });
  }
}
