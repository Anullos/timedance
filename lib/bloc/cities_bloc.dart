import 'package:flutter/cupertino.dart';
import 'package:timedance/data/store_implement.dart';
import 'package:timedance/data/store_repository.dart';
import 'package:timedance/model/city.dart';

class CitiesBloc extends ChangeNotifier {
  
  List<City> cities = [];
  final StoreRepository storage = StoreImplement();

  void loadCities() async{
    cities = await storage.getCities();
    notifyListeners();
  }
}