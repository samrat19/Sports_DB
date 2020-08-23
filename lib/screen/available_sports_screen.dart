import 'package:Sports_DB/logic/businessLogic/sports_database_bloc.dart';
import 'package:Sports_DB/logic/model/country_sports_model.dart';
import 'package:Sports_DB/tools/sports_details_widget_model.dart';
import 'package:flutter/material.dart';

class AvailableSportsScreen extends StatefulWidget {
  final String countryName;

  const AvailableSportsScreen({
    Key key,
    @required this.countryName,
  }) : super(key: key);

  @override
  _AvailableSportsScreenState createState() => _AvailableSportsScreenState();
}

class _AvailableSportsScreenState extends State<AvailableSportsScreen> {
  bool isTapped = true;
  String search = '';
  String errorMessage = 'Getting Sports.....';

  @override
  void initState() {
    super.initState();
    sportsDatabaseBloc..getSports();
    sportsDatabaseBloc..getCountryLeague(widget.countryName);
  }

  getSearch(String searchString) {
    sportsDatabaseBloc..drainStream();
    sportsDatabaseBloc..getSports();
    sportsDatabaseBloc..getSearchedLeague(searchString, widget.countryName);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var items = ['a', 'b'];
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.14,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 10.0,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        sportsDatabaseBloc..drainStream();
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: width * 0.07,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      widget.countryName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.06,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isTapped = true;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: height * 0.07,
                  color: Colors.grey[200],
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: isTapped
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              bottom: 8.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                    child: TextField(
                                    onChanged: (val) {
                                      setState(() {
                                        print(val);
                                        search = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Search leagues...',
                                      hintStyle: TextStyle(
                                        color: Colors.black26,
                                        fontSize: 13.0,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 7.0,
                                    right: 5.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      print(search);
                                      getSearch(search);
                                    },
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.grey[900],
                                      size: width * 0.07,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Search leagues...',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          StreamBuilder<List<CountrySportsModel>>(
              stream: sportsDatabaseBloc.getCountryLeagueSports,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<CountrySportsModel> countrySports = snapshot.data;
                  return Expanded(
                    child: Container(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (_, int index) => SportsDetailsWidgetModel(
                          leagueName: countrySports[index]
                              .countryLeagueModel
                              .leagueName,
                          leagueLogo: countrySports[index]
                              .countryLeagueModel
                              .leagueLogo,
                          twitterURL: countrySports[index]
                              .countryLeagueModel
                              .twitterProfileLink,
                          facebookURL: countrySports[index]
                              .countryLeagueModel
                              .facebookProfileLink,
                          sportsName: countrySports[index]
                              .countryLeagueModel
                              .sportsName,
                          sportsThumbnailImage: countrySports[index].thumbnail,
                        ),
                        itemCount: countrySports == null
                            ? 0
                            : sportsDatabaseBloc.totalLeague(),
                      ),
                    ),
                  );
                } else {
                  return Text(errorMessage);
                }
              }),
        ],
      ),
    );
  }
}
