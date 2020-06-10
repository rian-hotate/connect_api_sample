import 'dart:async';

import 'package:connect_api_sample/api/api.dart';
import 'package:connect_api_sample/model/model.dart';

class Bloc {
  final StreamController<Model> streamController = StreamController<Model>();
  final Api api = Api();

  void get() {
    api.getWeather().then((value) {
      streamController.sink.add(value);
    }).catchError((onError) {
      streamController.sink.addError(onError);
    });
  }

  void dispose() {
    streamController.close();
  }
}