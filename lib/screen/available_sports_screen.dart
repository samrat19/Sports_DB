import 'package:flutter/material.dart';

class AvailableSportsScreen extends StatelessWidget {
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
                      'Country',
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
            child: Container(
              height: height * 0.07,
              color: Colors.amber,
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, int index) => SportsDetailsModel(),
                itemCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SportsDetailsModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: height * 0.25,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/soccer.jpg'),
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
                'American Major League Soccer',
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
                    height: 25.0,
                    width: 110.0,
                    color: Colors.amber,
                  ),
                ),
              ),
              Row(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.saturation,
                    ),
                    child: Image.asset(
                      'images/twitter.png',
                      width: width * 0.08,
                      colorBlendMode: BlendMode.lighten,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.saturation,
                    ),
                    child: Image.asset(
                      'images/facebook.png',
                      width: width * 0.08,
                      colorBlendMode: BlendMode.lighten,
                    ),
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
