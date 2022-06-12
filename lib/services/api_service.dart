import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../models/Fixtures.dart';

class ApiService {

  static const _fixtureEndpoint = 'https://odds-api.dev.checkd-dev.com/dev/smartacca/football/fixtures/';
  static const _badgeEndpoint = 'https://cdn.fantasyiteam.com/bethub/';
  final _client = http.Client();

  //Fixture Methods
  Future<Fixtures?> getFixtures(DateTime date) async{
    print('ApiService.getFixtures');
    try {

      // Formatting the date in ISO8601 standards with just the year-month-day
      // Making sure the month and day include the 0 if only one digit
      var formattedDate = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

      var endpoint = Uri.parse(_fixtureEndpoint+formattedDate);
      print(endpoint);
      var response =
      await _client.get(endpoint);
      if (response.statusCode == 200) {
        try {
          print(response.body);
          var body = json.decode(response.body);
          print(body);
          var fixtures = Fixtures.fromJson(body);
          print("Found Fixtures: $fixtures");
          return fixtures;
        } catch (e) {
          print(e.toString());
        }
      } else {
        print('No Fixtures Found');
        print(response.body);
        return null;
      }
    } catch (e) {
      print("error");
      return null;
    }
  }
  //Team Methods

  //Competition Methods


}