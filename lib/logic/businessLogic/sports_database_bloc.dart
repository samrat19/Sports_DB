import 'package:Sports_DB/logic/model/country_sports_model.dart';
import 'package:Sports_DB/logic/resources/loadAsset.dart';
import 'package:Sports_DB/logic/resources/store_url.dart';
import 'package:Sports_DB/logic/responses/country_league_response.dart';
import 'package:Sports_DB/logic/responses/sports_response.dart';
import 'package:rxdart/rxdart.dart';

/*All the business logic to perform the operations*/
class SportsDataBaseBloc {
  final LoadAsset _loadAsset = LoadAsset();

  final BehaviorSubject<CountryLeagueResponse> _countrySubject =
      BehaviorSubject<CountryLeagueResponse>();
  final BehaviorSubject<SportsResponse> _sportsSubject =
      BehaviorSubject<SportsResponse>();

  /*getting response from the sports api and add to the stream*/
  getSports() async {
    SportsResponse sportsResponse =
        await _loadAsset.loadSports(StoreURL().sportsURL);
    _sportsSubject.sink.add(sportsResponse);
  }

  /*getting response from the leagues per country api and add to the stream*/
  getCountryLeague(String countryName) async {
    CountryLeagueResponse countryLeagueResponse = await _loadAsset
        .loadCountryLeague(StoreURL().countryLeagueURL + countryName);
    _countrySubject.sink.add(countryLeagueResponse);
  }

  /*getting response from the search api and add to the stream*/
  getSearchedLeague(String searchString, String countryName) async {
    CountryLeagueResponse countryLeagueResponse =
        await _loadAsset.loadCountryLeague(
            StoreURL().searchURL + '?s=' + searchString + '&c=' + countryName);
    _countrySubject.sink.add(countryLeagueResponse);
  }

  List<CountrySportsModel> countrySports = [];
  int countryLeagueLength;

  /*Merges the sports stream and countryLeague stream to get sports thumbnail*/
  Stream<List<CountrySportsModel>> get getCountryLeagueSports =>
      Rx.combineLatest2(countryLeagueSubject.stream, sportSubject.stream,
          (CountryLeagueResponse leagueResponse,
              SportsResponse sportsResponse) {
        for (var league in leagueResponse.countryLeagueList) {
          for (var sports in sportsResponse.sportsList) {
            if (league.sportsName == sports.sportsName) {
              countrySports.add(
                CountrySportsModel(
                  league,
                  sports.sportsThumbnailImage,
                ),
              );
            }
          }
        }
        return countrySports;
      });

  /*returns total number of leagues available in the country*/
  int totalLeague() {
    return countryLeagueLength;
  }

  String message = 'Getting available Sports for the country';

  String errorMessage(){
    return message;
  }

  dispose() {
    _countrySubject.close();
    _sportsSubject.close();
  }

  /*removes all the previous data from the stream*/
  void drainStream() {
    countrySports.clear();
    _countrySubject.value = null;
    _sportsSubject.value = null;
  }

  BehaviorSubject<SportsResponse> get sportSubject => _sportsSubject;

  BehaviorSubject<CountryLeagueResponse> get countryLeagueSubject =>
      _countrySubject;
}

final sportsDatabaseBloc = SportsDataBaseBloc();
