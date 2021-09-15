import 'package:flutter/material.dart';
import 'package:notes_app/sample.dart';

import 'edit_note_screen.dart';
import 'inherited_widgets/inherited_widget.dart';

class Cell extends StatefulWidget {
  final int index;
  const Cell(this.index);

  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context)!.note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        alignment: Alignment.center,
        height: 70.0,
        width: 30.0,
        decoration: BoxDecoration(
            gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [-1.00, 0.02],
                colors: [colors[widget.index], Color(0xffFFFFFF)]),
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xffFFFFFF)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    _notes[widget.index]["title"]!,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 5,
                  ),
                ),
                Text(
                  _notes[widget.index]["id"]!,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Text(
                _notes[widget.index]["data"]!,
                style: TextStyle(fontSize: 16.0, letterSpacing: 0.6),
                maxLines: 8,
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => EditNoteScreen(widget.index, NoteState.Curent))),
    );
  }
}
