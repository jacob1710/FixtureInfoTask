class Period{
  late int id;
  late DateTime start;
  late DateTime end;
  late int lengthMin;
  late int lengthSec;
  Period.fromJson(Map<String, dynamic> json){
    id = json['id'];
    start = DateTime.parse(json['start']);
    end = DateTime.parse(json['end']);
    lengthMin = json['lengthMin'];
    lengthSec = json['lengthSec'];
  }

}