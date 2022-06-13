import 'Period.dart';
import 'Score.dart';

class MatchDetails{
  late int periodId;
  late String matchStatus;
  late String winner;
  late int? matchLengthMin;
  late int? matchLengthSec;
  late List<Period> periods;
  late Map<String, Score> scores;
  late DateTime? endDate;

  MatchDetails.fromJson(Map<String, dynamic> json){

    periodId = json['periodId'];
    matchStatus = json['matchStatus'];
    winner = json['winner'];
    matchLengthMin = json['matchLengthMin'];
    matchLengthSec = json['matchLengthSec'];
    if(json['endDate'] != null){
      endDate = DateTime.parse(json['endDate']);
    }
    if(json['period'] != null){
      periods = <Period>[];
      json['period'].forEach((v){
        periods.add(Period.fromJson(v));
      });
    }
    if (json['scores']!= null){

      //Adding Scores to dict if they are present
      var jsonScores = json['scores'];
      scores = {};
      if(jsonScores['ht'] != null) {
        var htScore = Score.fromJson(jsonScores['ht'], 'ht');
        scores['ht'] = htScore;
      }

      var ftScore = Score.fromJson(jsonScores['ft'], 'ft');
      scores['ft'] = ftScore;

      if(jsonScores['et'] != null){
        var etScore = Score.fromJson(jsonScores['et'], 'et');
        scores['et'] = etScore;
      }
      var totalScore = Score.fromJson(jsonScores['total'], 'total');
      scores['total'] = totalScore;
    }

  }

}