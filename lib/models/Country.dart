class Country{
  late String id;
  late String name;
  Country.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }
}