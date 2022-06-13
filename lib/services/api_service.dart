import 'package:fixture_info_task/utils/date_formatter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../models/Fixtures.dart';

class ApiService {

  static const _fixtureEndpoint = 'https://odds-api.dev.checkd-dev.com/dev/smartacca/football/fixtures/';
  final _client = http.Client();

  //Fixture Methods
  Future<Fixtures?> getFixtures(DateTime date) async{
    // print('ApiService.getFixtures');
    try {

      var endpoint = Uri.parse(_fixtureEndpoint+DateFormatter.getDateInYMD(date));
      // print(endpoint);
      var response =
      await _client.get(endpoint);
      if (response.statusCode == 200) {
        try {
          var body = json.decode(utf8.decode(response.bodyBytes));
          var fixtures = Fixtures.fromJson(body);
          return fixtures;
        } catch (e) {
          print(e.toString());
        }
      } else {
        // print('No Fixtures Found');
        // print(response.body);
        return null;
      }
    } catch (e) {
      // print("error");
      return null;
    }
  }
  //Team Methods

  //Competition Methods


}