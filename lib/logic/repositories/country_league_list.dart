import 'package:Sports_DB/logic/model/country_league_model.dart';

class CountryLeagueList{
  final List<CountryLeagueModel> countryLeagueList;

  CountryLeagueList(this.countryLeagueList);

  CountryLeagueList.fromJson(List<dynamic> countryLeagueJSON)
      : countryLeagueList = countryLeagueJSON.map(
          (countryLeague) => CountryLeagueModel.fromJSON(countryLeague)).toList();
}