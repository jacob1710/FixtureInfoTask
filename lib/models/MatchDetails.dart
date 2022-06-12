import 'Period.dart';
import 'Score.dart';

class MatchDetails{
  late int periodId;
  late String matchStatus;
  late String winner;
  late int matchLengthMin;
  late int matchLengthSec;
  late List<Period> periods;
  late List<Score> scores;
  late DateTime endDate;

  MatchDetails.fromJson(Map<String, dynamic> json){

    periodId = json['periodId'];
    matchStatus = json['matchStatus'];
    winner = json['winner'];
    matchLengthMin = json['matchLengthMin'];
    matchLengthSec = json['matchLengthSec'];
    endDate = DateTime.parse(json['endDate']);
    if(json['period'] != null){
      periods = <Period>[];
      json['period'].forEach((v){
        periods.add(Period.fromJson(v));
      });
    }

    if (json['scores']!= null){
      var jsonScores = json['scores'];
      var htScore = Score.fromJson(jsonScores['ht'], 'ht');
      var ftScore = Score.fromJson(jsonScores['ft'], 'ft');
      var totalScore = Score.fromJson(jsonScores['total'], 'total');
      scores = <Score>[];
      scores.add(htScore);
      scores.add(ftScore);
      scores.add(totalScore);
    }


  }

}