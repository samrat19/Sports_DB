import 'package:Sports_DB/logic/model/country_league_model.dart';

class CountryLeagueResponse{
  final List<CountryLeagueModel> countryLeagueList;

  CountryLeagueResponse(this.countryLeagueList);

  CountryLeagueResponse.fromJSON(Map<String, dynamic> responseJSON)
      : countryLeagueList = (responseJSON['countrys'] as List)
      .map((sports) => CountryLeagueModel.fromJSON(sports))
      .toList();
}