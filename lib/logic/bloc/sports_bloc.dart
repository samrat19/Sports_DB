import 'dart:convert';
import 'package:Sports_DB/logic/repositories/sports_list.dart';
import 'package:Sports_DB/logic/resources/loadAsset.dart';
import 'package:Sports_DB/logic/resources/store_url.dart';
import 'package:Sports_DB/logic/model/sports_model.dart';

class SportsBloc{
  final String sportsUrl = StoreURL().sportsURL;

  List<SportsModel> sportsList;

  Future<List<SportsModel>> loadSportsData() async {
    var dataString = await LoadAsset().loadAsset(sportsUrl);
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    sportsList = SportsList.fromJson(jsonUserData['articles']).sportsList;
    return sportsList;
  }
}