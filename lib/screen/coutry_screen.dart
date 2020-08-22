import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height*0.15,
          ),
          Text(
            'The Sports DB',
            style: TextStyle(color: Colors.white, fontSize: width * 0.1, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_,int index) => CountryModel(),
                  itemCount: 10,
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      child: GestureDetector(
        onTap: null,
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
                    'Country',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.07,
                    ),
                  ),
                  Image.asset('images/arrow_right.png',width: width*0.1,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

