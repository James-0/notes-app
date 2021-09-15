import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/cell.dart';
import 'package:notes_app/edit_note_screen.dart';
import 'package:notes_app/inherited_widgets/inherited_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearchPressed = false;
  bool _isBackPressed = false;
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context)!.note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffF0F0F0),
        title: !_isBackPressed
            ? Visibility(
                visible: !_isBackPressed,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'My Notes',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _isBackPressed = true;
                              _isSearchPressed = true;
                            });
                          },
                          icon: Icon(Icons.search))
                    ],
                  ),
                ),
              )
            : Visibility(
                visible: _isSearchPressed,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _isSearchPressed = false;
                              _isBackPressed = false;
                            });
                          },
                          icon: Icon(Icons.arrow_back)),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          width: MediaQuery.of(context).size.width * 0.60,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Color(0xffF0F0F0), width: 3.0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          alignment: Alignment.centerLeft,
                          child: TextField(
                              textCapitalization: TextCapitalization.sentences,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff2E2E2E),
                              ),
                              decoration: InputDecoration.collapsed(
                                hintText: 'search...',
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          itemCount: _notes.length,
          itemBuilder: (BuildContext context, int index) {
            return Cell(index);
          },
          staggeredTileBuilder: (int index) {
            return StaggeredTile.count(1, index.isEven ? 1.5 : 1.8);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0000FF),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => EditNoteScreen(null, NoteState.New))),
        tooltip: 'new note',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
