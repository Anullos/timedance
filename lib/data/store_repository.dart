import 'package:timedance/model/city.dart';

abstract class StoreRepository {
  Future<void> saveCity(City city);
  Future<List<City>> getCities();
}
