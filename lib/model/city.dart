import 'package:timedance/model/clima.dart';

class City{

  final String title;
  final int id;
  final List<Clima> climas;

  City({this.title, this.id, this.climas});

  Map<String,dynamic> toJson() => {
    "woeid": id,
    "title": title,
    "climas": climas.map((e) => e.toJson()).toList(),
  };

  factory City.fromJson(Map<String,dynamic> map){
    final misClimas = map['climas'];
    return City(
      id: map['woeid'],
      title: map['title'],
      climas: misClimas !=null ? (misClimas as List).map((e) => Clima.fromJson(e)).toList(): null,
      );
  }

  City fromClimas(List<Clima> climas){
    return City(
      id: id,
      title: title,
      climas: climas,
      );
  }
}