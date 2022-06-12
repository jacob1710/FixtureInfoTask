import 'Event.dart';

class Competition{
  late String id;
  late String name;
  late String stage;
  late List<Event> events;
  Competition.fromJson(Map<String, dynamic> json){
    id = json['competition']['id'];
    name = json['competition']['name'];
    stage = json['competition']['stage'];
    if(json['events'] != null){
      events = <Event>[];
      json['events'].forEach((v){
        events.add(Event.fromJson(v));
      });
    }
  }
}