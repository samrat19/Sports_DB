import 'dart:convert';
import 'package:Sports_DB/logic/repositories/country_league_response.dart';
import 'package:Sports_DB/logic/repositories/sports_response.dart';
import 'package:Sports_DB/logic/resources/store_url.dart';
import 'package:http/http.dart' as http;

class LoadAsset{
  Future<SportsResponse> loadSports(String url) async {
    var response = await http.get(Uri.encodeFull(StoreURL().baseURL+url),
        headers: {"Accept": "application/json"});
    return SportsResponse.fromJSON(
      json.decode(response.body),
    );
  }

  Future<CountryLeagueResponse> loadCountryLeague(String url) async {
    var response = await http.get(Uri.encodeFull(StoreURL().baseURL+url),
        headers: {"Accept": "application/json"});
    print(StoreURL().baseURL+url);
    print(response.body);
    return CountryLeagueResponse.fromJSON(
      json.decode(response.body),
    );
  }
}