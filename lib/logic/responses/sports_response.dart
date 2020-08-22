import 'package:Sports_DB/logic/model/sports_model.dart';

class SportsResponse{
  final List<SportsModel> sportsList;

  SportsResponse(this.sportsList);

  SportsResponse.fromJSON(Map<String, dynamic> responseJSON)
      : sportsList = (responseJSON['sports'] as List)
      .map((sports) => SportsModel.fromJSON(sports))
      .toList();
}