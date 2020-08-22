import 'package:flutter/material.dart';

class CountryLeagueModel {
  final String leagueName;
  final String leagueLogo;
  final String twitterProfileLink;
  final String facebookProfileLink;
  final String sportsName;

  const CountryLeagueModel({
    @required this.leagueName,
    @required this.leagueLogo,
    @required this.twitterProfileLink,
    @required this.facebookProfileLink,
    @required this.sportsName,
  });

  CountryLeagueModel.fromJSON(Map<dynamic, dynamic> countryLeagueJson)
      : this.leagueName = countryLeagueJson['strLeague'],
        this.leagueLogo = countryLeagueJson['strLogo'],
        this.twitterProfileLink = countryLeagueJson['strTwitter'],
        this.facebookProfileLink = countryLeagueJson['strFacebook'],
        this.sportsName = countryLeagueJson['strSport'];
}
