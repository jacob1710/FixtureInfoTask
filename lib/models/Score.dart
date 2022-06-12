class Score{
  late String name;
  late int home;
  late int away;

  Score({required this.home, required this.away});

  Score.fromJson(Map<String, dynamic> json, String scoreName){
    home = json['home'];
    away = json['away'];
    name = scoreName;

  }
}