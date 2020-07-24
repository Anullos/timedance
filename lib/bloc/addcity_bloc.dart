import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:timedance/data/store_implement.dart';
import 'package:timedance/data/store_repository.dart';
import 'package:timedance/model/city.dart';
import 'package:timedance/model/clima.dart';
import 'package:timedance/ui/propiedades.dart';
import 'package:timedance/ui/widgets/debouncer.dart';
import 'package:http/http.dart' as http;

class AddCityBloc extends ChangeNotifier {
  final debouncer = Debouncer();
  final StoreRepository storage = StoreImplement();
  List<City> cities = [];
  bool loading = false;
  String errorMessage;

  void onChangedText(String text) {
    debouncer.run(() {
      // print('print : $text');
      if (text.isNotEmpty) requestServer(text);
    });
  }

  void requestServer(String text) async {
    loading = true;
    notifyListeners();

    final url = '${api}search/?query=$text';
    final response = await http.get(url);
    final data = jsonDecode(response.body) as List;

    loading = false;
    cities = data.map((e) => City.fromJson(e)).toList();
    notifyListeners();
  }

  Future<bool> addCity(City city) async {
    loading = true;
    notifyListeners();

    final url = '$api${city.id}';
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final climaData = data['consolidated_weather'] as List;
    final climas = climaData.map((e) => Clima.fromJson(e)).toList();
    final newCity = city.fromClimas(climas);
    try {
      await storage.saveCity(newCity);
      errorMessage = null;
      return true;
    } catch (e) {
      print(e);
      errorMessage = e.toString();
      loading = false;
      notifyListeners();
      return false;
    }
    // print(newCity.toJson());
  }
}
