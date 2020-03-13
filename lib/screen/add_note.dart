import 'package:flutter/material.dart';
import 'package:note/main.dart';

class AddNote extends StatefulWidget {
  final Function addTx;
  AddNote(this.addTx);
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final enteredTitleController = new TextEditingController();
  final enteredDescriptionController = new TextEditingController();
  void submitData(BuildContext ctx) {
    String enteredTitle = enteredTitleController.text;
    String enteredDescription = enteredDescriptionController.text;
    if (enteredTitle.isEmpty || enteredDescription.isEmpty) {
      return;
    }
    widget.addTx(enteredTitle, enteredDescription);
    Navigator.pop(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(labelText: "Title"),
          controller: enteredTitleController,
          onSubmitted: (_) {
            submitData(context);
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: "Description"),
          controller: enteredDescriptionController,
          onSubmitted: (_) {
            submitData(context);
          },
          minLines: 1,
          maxLines: 20,
        ),
        RaisedButton(
          textColor: Colors.white,
          color: Theme.of(context).accentColor,
          child: Text(
            "Add Note",
          ),
          onPressed: () {
            submitData(context);
          },
        ),
      ],
    ));
  }
}
