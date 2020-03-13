import 'package:flutter/material.dart';
import 'package:note/model/note_data.dart';
import 'package:note/screen/overview_screen.dart';

class NoteDetailScreen extends StatefulWidget {
  static const routeName = "/note_detail_screen";

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  List<NoteData> noteData;

  String selectedNoteTitle;

  String selectedNoteDescription;

  TextEditingController enteredDescriptionController;

  @override
  Widget build(BuildContext context) {
    final routeArgument = ModalRoute.of(context).settings.arguments as Map;
    selectedNoteTitle = routeArgument['title'];
    selectedNoteDescription = routeArgument['description'];

    return Scaffold(
        appBar: AppBar(
          title: Text("Note"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Text(
              selectedNoteTitle,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              selectedNoteDescription,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ));
  }
}
