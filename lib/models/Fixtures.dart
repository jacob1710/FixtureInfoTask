import 'Competition.dart';

class Fixtures{
  late int code;
  late List<Competition> competitions;
  Fixtures({required this.code, required this.competitions});

  Fixtures.fromJson(Map<String, dynamic> json){
    code = json['code'];
    if(json['competitions'] != null){
      competitions = <Competition>[];
      json['competitions'].forEach((v){
        competitions.add(Competition.fromJson(v));
      });
    }

  }
}