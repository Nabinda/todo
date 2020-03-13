import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:note/model/note_data.dart';
import 'package:note/screen/note_detail_screen.dart';
import 'add_note.dart';

class OverviewScreen extends StatefulWidget {
  static const routeName = "/overview_screen";
  DateTime dateTime;
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  List<NoteData> _noteData = [];
  DateTime getDateTime(int i) {
    DateTime noteDate = DateTime.parse(_noteData[i].id);
    return noteDate;
  }

  void addNote(String txTitle, String txDescription) {
    final newTx = NoteData(
        title: txTitle,
        description: txDescription,
        id: DateTime.now().toString());
    setState(() {
      _noteData.add(newTx);
    });
  }

  void deleteNote(String id) {
    setState(() {
      _noteData.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
        centerTitle: true,
      ),
      body: _noteData.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        "Add a Note!!!",
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.network(
                        "https://emssound.net/wp-content/uploads/2018/01/NOTES.ico",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: _noteData.length,
              itemBuilder: (ctx, index) {
                return Dismissible(
                  key: ValueKey(_noteData[index].id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    deleteNote(_noteData[index].id);
                  },
                  background: Container(
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 40,
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, NoteDetailScreen.routeName,
                          arguments: {
                            "title": _noteData[index].title,
                            "description": _noteData[index].description,
                            "id": index
                          });
                    },
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10.0),
                      elevation: 6,
                      child: ListTile(
                        title: Text(
                          _noteData[index].title,
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text(
                          DateFormat.yMMMEd()
                              .format(getDateTime(index))
                              .toString(),
                        ),
                      ),
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (ctx) {
                return AddNote(addNote);
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
