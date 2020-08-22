import 'package:Sports_DB/logic/model/sports_model.dart';

class SportsList{
  final List<SportsModel> sportsList;

  SportsList(this.sportsList);

  SportsList.fromJson(List<dynamic> sportsJSON)
      : sportsList = sportsJSON.map(
          (sports) => SportsModel.fromJSON(sports)).toList();
}