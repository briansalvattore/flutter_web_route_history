import 'package:flutter/material.dart';
import 'package:test_routes/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {        
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => HomePage(
            route: settings.name,
          ),
        );
      },
      home: HomePage(),
    );
  }
}
