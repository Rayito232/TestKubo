import 'package:example_api/pages/home_page.dart';
import 'package:example_api/utils/preference.dart';

import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preference().initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Plaza',
      home: HomePage(),
    );
  }
}
