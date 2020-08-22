import 'dart:convert';
import 'dart:developer';
import 'package:Sports_DB/logic/repositories/country_league_response.dart';
import 'package:Sports_DB/logic/repositories/sports_response.dart';
import 'package:Sports_DB/logic/resources/store_url.dart';
import 'package:http/http.dart' as http;

class LoadAsset{
  Future<SportsResponse> loadSports(String url) async {
    var response = await http.get(Uri.encodeFull(StoreURL().baseURL+url),
        headers: {"Accept": "application/json"});
    log(StoreURL().baseURL+url);
    return SportsResponse.fromJSON(
      json.decode(response.body),
    );
  }

  Future<CountryLeagueResponse> loadCountryLeague(String url) async {
    var response = await http.get(Uri.encodeFull(StoreURL().baseURL+url),
        headers: {"Accept": "application/json"});
    return CountryLeagueResponse.fromJSON(
      json.decode(response.body),
    );
  }
}