import 'package:Sports_DB/logic/businessLogic/sports_database_bloc.dart';
import 'package:Sports_DB/logic/model/country_sports_model.dart';
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

  @override
  void initState() {
    super.initState();
    sportsDatabaseBloc..getSports();
    sportsDatabaseBloc..getCountryLeague(widget.countryName);
  }

  getSearch(String searchString){
    sportsDatabaseBloc..drainStream();
    sportsDatabaseBloc..getSports();
    sportsDatabaseBloc..getSearchedLeague(searchString,widget.countryName);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                                    onChanged: (val){
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
                                    onTap: (){
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
                  return snapshot.data.length == null? Text('Sorry') :Expanded(
                    child: Container(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (_, int index) => SportsDetailsModel(
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
                        itemCount:
                            countrySports == null ? 0 : sportsDatabaseBloc.totalLeague(),
                      ),
                    ),
                  );
                }
                else {
                  return Text('Fetching');
                }
              }),
        ],
      ),
    );
  }
}

class SportsDetailsModel extends StatelessWidget {
  final String leagueName;
  final String leagueLogo;
  final String facebookURL;
  final String twitterURL;
  final String sportsName;
  final String sportsThumbnailImage;

  const SportsDetailsModel({
    Key key,
    @required this.leagueName,
    @required this.leagueLogo,
    @required this.facebookURL,
    @required this.twitterURL,
    @required this.sportsName,
    @required this.sportsThumbnailImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Container(
        height: height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: sportsThumbnailImage == null
                ? AssetImage('images/soccer.jpg')
                : NetworkImage(sportsThumbnailImage),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.0,
            bottom: 10.0,
            left: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leagueName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.045,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.3,
                    child: leagueLogo != null
                        ? Image.network(leagueLogo, fit: BoxFit.cover)
                        : SizedBox(
                            width: 1,
                          ),
                  ),
                ),
              ),
              Row(
                children: [
                  twitterURL != null
                      ? ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.saturation,
                          ),
                          child: Image.asset(
                            'images/twitter.png',
                            width: width * 0.08,
                            colorBlendMode: BlendMode.lighten,
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                  SizedBox(
                    width: 10.0,
                  ),
                  facebookURL != null
                      ? ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.saturation,
                          ),
                          child: Image.asset(
                            'images/facebook.png',
                            width: width * 0.08,
                            colorBlendMode: BlendMode.lighten,
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
