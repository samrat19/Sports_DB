import 'package:Sports_DB/screen/available_sports_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> countryNameList = [
      'India',
      'United States',
      'Australia',
      'China',
      'Argentina',
      'Canada',
    ];

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.12,
          ),
          Text(
            'The Sports DB',
            style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.1,
                fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, int index) => CountryModel(
                    countryName: countryNameList[index],
                  ),
                  itemCount: countryNameList.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountryModel extends StatelessWidget {
  final String countryName;

  const CountryModel({Key key, @required this.countryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (_) => AvailableSportsScreen(
                countryName: countryName,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7.0),
          clipBehavior: Clip.hardEdge,
          child: Container(
            color: Colors.red[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    countryName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.07,
                    ),
                  ),
                  Image.asset(
                    'images/arrow_right.png',
                    width: width * 0.1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}