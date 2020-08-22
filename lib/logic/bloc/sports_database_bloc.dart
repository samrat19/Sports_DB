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
    CountryLeagueResponse countryLeagueResponse =
        await _loadAsset.loadCountryLeague(StoreURL().countryLeagueURL+countryName);
    _countrySubject.sink.add(countryLeagueResponse);
  }

  dispose() {
    _countrySubject.close();
    _sportsSubject.close();
  }

  BehaviorSubject<SportsResponse> get sportSubject => _sportsSubject;

  BehaviorSubject<CountryLeagueResponse> get countryLeagueSubject =>
      _countrySubject;
}

final sportsDatabaseBloc = SportsDataBaseBloc();
