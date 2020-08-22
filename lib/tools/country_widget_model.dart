import 'package:Sports_DB/screen/available_sports_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryWidgetModel extends StatelessWidget {
  final String countryName;

  const CountryWidgetModel({
    Key key,
    @required this.countryName,
  }) : super(key: key);

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
