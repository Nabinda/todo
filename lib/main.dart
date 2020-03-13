import 'package:flutter/material.dart';

import 'screen/note_detail_screen.dart';
import 'screen/overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NOTE",
      home: OverviewScreen(),
      routes: {
        NoteDetailScreen.routeName: (ctx) => NoteDetailScreen(),
        OverviewScreen.routeName: (ctx) => OverviewScreen(),
      },
    );
  }
}
