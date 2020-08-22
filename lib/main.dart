import 'package:flutter/material.dart';

import 'screen/country_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountryScreen(),
    );
  }
}
