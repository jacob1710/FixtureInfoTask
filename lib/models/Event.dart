import 'package:fixture_info_task/models/Competition.dart';
import 'package:fixture_info_task/models/Contestant.dart';
import 'package:fixture_info_task/models/MatchDetails.dart';

class Event{

  late String id;
  late List<Contestant> contestants;
  late DateTime date;
  late String description;
  late Competition meta;
  late String status;
  late MatchDetails matchDetails;

  Event.fromJson(Map<String, dynamic> json){
    id = json['id'];
    if (json['contestant'] != null){
      contestants = <Contestant>[];
      json['contestant'].forEach((v){
        contestants.add(Contestant.fromJson(v));
      });
    }
    date = DateTime.parse(json['date']);
    description = json['description'];
    meta = Competition.fromJson(json['meta']);
    status = json['status'];
    matchDetails = MatchDetails.fromJson(json['liveData']['matchDetails']);
  }

}