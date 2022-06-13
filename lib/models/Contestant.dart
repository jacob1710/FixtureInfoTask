import 'Country.dart';

class Contestant{
  late String id;
  late String name;
  late String shortName;
  late String officialName;
  late String code;
  late String position;
  late Country? country;
  Contestant.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    officialName = json['officialName'];
    code = json['code'];
    position = json['position'];
    if(json['country'] != null){
      country = Country.fromJson(json['country']);
    }
  }
}