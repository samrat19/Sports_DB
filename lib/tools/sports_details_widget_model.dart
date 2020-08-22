import 'package:flutter/material.dart';

class SportsDetailsWidgetModel extends StatelessWidget {
  final String leagueName;
  final String leagueLogo;
  final String facebookURL;
  final String twitterURL;
  final String sportsName;
  final String sportsThumbnailImage;

  const SportsDetailsWidgetModel({
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