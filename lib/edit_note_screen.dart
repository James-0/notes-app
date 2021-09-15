import 'package:flutter/material.dart';

import 'inherited_widgets/inherited_widget.dart';

class EditNoteScreen extends StatefulWidget {
  final int? index;
  final NoteState noteState;
  EditNoteScreen(this.index, this.noteState);

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _dataEditingController = TextEditingController();

  List<Map<String, String>>? get _notes =>
      NoteInheritedWidget.of(context)!.note;

  bool _isEnabled = true;
  bool _isVisible = true;

  @override
  void didChangeDependencies() {
    if (widget.noteState == NoteState.Curent) {
      _titleEditingController.text = _notes![widget.index!]['title']!;
      _dataEditingController.text = _notes![widget.index!]['data']!;
      _isVisible = false;
      _isEnabled = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 20.0,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xffEEEEEE),
        title: TextField(
            controller: _titleEditingController,
            enabled: _isEnabled,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.multiline,
            textAlign: TextAlign.left,
            maxLines: null,
            style: TextStyle(color: Colors.black, fontSize: 24.0),
            decoration: InputDecoration.collapsed(
              hintText: 'note title...',
            )),
        actions: [
          Visibility(
            visible: !_isVisible,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    _isEnabled = true;
                    _isVisible = true;
                  });
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: Container(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
        child: Column(
          children: [
            Container(
              child: Expanded(
                  child: TextField(
                      controller: _dataEditingController,
                      enabled: _isEnabled,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.left,
                      maxLines: null,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff2E2E2E),
                      ),
                      decoration: InputDecoration.collapsed(
                        hintText: 'Type your note here...',
                      ))),
            ),
            Visibility(
              visible: _isVisible,
              child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.width * 0.14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xff0000FF)),
                  child: TextButton(
                    child: Text(
                      "Save note",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    onPressed: () {
                      setState(() {
                        _isVisible = false;
                        _isEnabled = false;
                      });
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}

enum NoteState { New, Curent }
