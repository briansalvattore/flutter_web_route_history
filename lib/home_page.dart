import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test_routes/four_fragment.dart';
import 'package:test_routes/one_fragment.dart';
import 'package:test_routes/three_fragment.dart';
import 'package:test_routes/two_fragment.dart';

class HomePage extends StatefulWidget {
  final String route;

  HomePage({this.route = '/'});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  void initState() {
    switch (widget.route) {
      case '/four':
        _index = 4;
        break;
      case '/three':
        _index = 3;
        break;
      case '/two':
        _index = 1;
        break;
      case '/':
      default:
        _index = 0;
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 400.0,
            color: Colors.grey[200],
            child: ListView(
              children: <Widget>[
                ListTile(
                  onTap: () {
                    setState(() => _index = 0);
                    window.history.pushState(null, null, '/#/one');
                  },
                  title: Text('Uno'),
                ),
                ListTile(
                  onTap: () {
                    setState(() => _index = 1);
                    window.history.pushState(null, null, '/#/two');
                  },
                  title: Text('Dos'),
                ),
                ListTile(
                  onTap: () {
                    setState(() => _index = 2);
                    window.history.pushState(null, null, '/#/three');
                  },
                  title: Text('Tres'),
                ),
                ListTile(
                  onTap: () {
                    setState(() => _index = 3);
                    window.history.pushState(null, null, '/#/four');
                  },
                  title: Text('Cuatro'),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _index,
              children: <Widget>[
                OneFragment(),
                TwoFragment(),
                ThreeFragment(),
                FourFragment(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
