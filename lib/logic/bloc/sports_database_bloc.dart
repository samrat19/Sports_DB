import 'dart:developer';

import 'package:Sports_DB/logic/model/country_league_model.dart';
import 'package:Sports_DB/logic/model/sports_model.dart';
import 'package:Sports_DB/logic/repositories/country_league_response.dart';
import 'package:Sports_DB/logic/repositories/sports_response.dart';
import 'package:Sports_DB/logic/resources/loadAsset.dart';
import 'package:Sports_DB/logic/resources/store_url.dart';
import 'package:rxdart/rxdart.dart';

class SportsDataBaseBloc {
  final LoadAsset _loadAsset = LoadAsset();

  final BehaviorSubject<CountryLeagueResponse> _countrySubject =
      BehaviorSubject<CountryLeagueResponse>();
  final BehaviorSubject<SportsResponse> _sportsSubject =
      BehaviorSubject<SportsResponse>();

  getSports() async {
    SportsResponse sportsResponse =
        await _loadAsset.loadSports(StoreURL().sportsURL);
    _sportsSubject.sink.add(sportsResponse);
  }

  getCountryLeague(String countryName) async {
    CountryLeagueResponse countryLeagueResponse = await _loadAsset
        .loadCountryLeague(StoreURL().countryLeagueURL + countryName);
    _countrySubject.sink.add(countryLeagueResponse);
  }

  List<CountrySports> countrySports = [];
  int countryLeagueLength;

  Stream<List<CountrySports>> get getCountryLeagueSports =>
      Rx.combineLatest2(countryLeagueSubject.stream, sportSubject.stream,
          (CountryLeagueResponse countryLeagueResponse,
              SportsResponse sportsResponse) {
        for (int i = 0;
            i < countryLeagueResponse.countryLeagueList.length;
            i++) {
          for (int j = 0; j < sportsResponse.sportsList.length; j++) {
            if (countryLeagueResponse.countryLeagueList[i].sportsName ==
                sportsResponse.sportsList[j].sportsName) {
              countrySports.add(
                CountrySports(
                  countryLeagueResponse.countryLeagueList[i],
                  sportsResponse.sportsList[j].sportsThumbnailImage,
                ),
              );
            }
          }
        }
        countryLeagueLength = countryLeagueResponse.countryLeagueList.length;
        return countrySports;
      });

  int totalLeague() {
    return countryLeagueLength;
  }

  dispose() {
    _countrySubject.close();
    _sportsSubject.close();
  }

  void drainStream() {
    print('I am here');
    countrySports.clear();
    _countrySubject.value = null;
    _sportsSubject.value = null;
  }

  BehaviorSubject<SportsResponse> get sportSubject => _sportsSubject;

  BehaviorSubject<CountryLeagueResponse> get countryLeagueSubject =>
      _countrySubject;
}

final sportsDatabaseBloc = SportsDataBaseBloc();

class CountrySports {
  final CountryLeagueModel countryLeagueModel;
  final String thumbnail;

  CountrySports(this.countryLeagueModel, this.thumbnail);
}
