import 'package:Sports_DB/tools/country_widget_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /*Available countries*/

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
                  itemBuilder: (_, int index) => CountryWidgetModel(
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