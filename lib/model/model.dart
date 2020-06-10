import 'package:connect_api_sample/model/weather.dart';

class Model {
  List<Weather> weather;

  Model({this.weather});

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    weather: json["weather"] == null ? [] : List<Weather>.from(json["weather"].map(
        (element) => Weather.fromJson(element)
    ).toList()),
  );
}