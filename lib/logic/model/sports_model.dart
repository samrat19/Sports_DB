import 'package:flutter/material.dart';

class SportsModel {
  final String sportsName;
  final String sportsThumbnailImage;

  const SportsModel({
    @required this.sportsName,
    @required this.sportsThumbnailImage,
  });

  SportsModel.fromJSON(Map<dynamic, dynamic> sportsJson)
      : this.sportsName = sportsJson['strSport'],
        this.sportsThumbnailImage = sportsJson['strSportThumb'];
}
