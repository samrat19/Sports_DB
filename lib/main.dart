import 'package:Sports_DB/logic/bloc/sports_database_bloc.dart';
import 'package:Sports_DB/logic/model/sports_model.dart';
import 'package:Sports_DB/logic/repositories/sports_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/country_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    sportsDatabaseBloc..getSports();
    sportsDatabaseBloc..getCountryLeague('India');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//        home: StreamBuilder<List<CountrySports>>(
//          stream: sportsDatabaseBloc.getCountryLeagueSports,
//          builder: (context, snapshot) {
//            if(snapshot.hasData){
//              List<CountrySports> countrySports = snapshot.data;
//              print(countrySports[2].countryLeagueModel.leagueName);
//            }else{
//              print(0);
//            }
//            return Container();
//          }
//        ),
    home: CountryScreen(),
      );
  }
}

//MaterialApp(
//home: StreamBuilder<List<CountrySports>>(
//stream: sportsDatabaseBloc.getCountryLeagueSports,
//builder: (context, snapshot) {
//if(snapshot.hasData){
//List<CountrySports> countrySports = snapshot.data;
//print(countrySports[2].countryLeagueModel.leagueName);
//}else{
//print(0);
//}
//return Container();
//}
//),
//);
