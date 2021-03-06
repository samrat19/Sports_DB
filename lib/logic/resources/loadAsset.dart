import 'dart:convert';
import 'package:Sports_DB/logic/businessLogic/sports_database_bloc.dart';
import 'package:Sports_DB/logic/resources/store_url.dart';
import 'package:Sports_DB/logic/responses/country_league_response.dart';
import 'package:Sports_DB/logic/responses/sports_response.dart';
import 'package:http/http.dart' as http;


/*perform operation to invoke the URLs and getting response*/
class LoadAsset{
  Future<SportsResponse> loadSports(String url) async {
    var response = await http.get(Uri.encodeFull(StoreURL().baseURL+url),
        headers: {"Accept": "application/json"});
    return SportsResponse.fromJSON(
      json.decode(response.body),
    );
  }

  Future<CountryLeagueResponse> loadCountryLeague(String url) async {
    try{
      var response = await http.get(Uri.encodeFull(StoreURL().baseURL + url),
          headers: {"Accept": "application/json"});
      return CountryLeagueResponse.fromJSON(
        json.decode(response.body),
      );
    }catch(e){
      sportsDatabaseBloc.message = 'Sorry This Sports is not Available in this Country';
      return null;
    }
  }
}