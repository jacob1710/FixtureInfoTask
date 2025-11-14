import 'Event.dart';

class Competition {
  late String id;
  late String name;
  late String stage;
  late List<Event> events;
  Competition.fromJson(Map<String, dynamic> json) {
    print(json);
    id = json['competition']['id'];
    stage = "";
    name = json['competition']['name'];
    if (json['events'] != null) {
      events = <Event>[];
      json['events'].forEach((v) {
        events.add(Event.fromJson(v));
      });
    }
  }
}
