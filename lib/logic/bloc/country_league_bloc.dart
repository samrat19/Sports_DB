//import 'dart:convert';
//import 'package:Sports_DB/logic/resources/loadAsset.dart';
//import 'package:Sports_DB/logic/resources/store_url.dart';
//import 'package:http/http.dart' as http;
//import 'package:Sports_DB/logic/model/country_league_model.dart';
//import 'package:Sports_DB/logic/repositories/country_league_response.dart';
//
//class CountryLeagueBloc{
//  final String countryLeagueURL = StoreURL().countryLeagueURL;
//
//  List<CountryLeagueModel> countryLeagueList;
//
//  Future<List<CountryLeagueModel>> loadSportsData() async {
//    var dataString = await LoadAsset().loadAsset(countryLeagueURL);
//    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
//    countryLeagueList = CountryLeagueList.fromJson(jsonUserData['articles']).countryLeagueList;
//    return countryLeagueList;
//  }
//
//}