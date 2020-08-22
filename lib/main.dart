import 'package:Sports_DB/screen/available_sports_screen.dart';
import 'package:flutter/material.dart';

import 'screen/coutry_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountryScreen(),
    );
  }
}
