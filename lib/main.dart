import 'package:flutter/material.dart';
import 'package:notes_app/home_page.dart';
import 'package:notes_app/inherited_widgets/inherited_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
      MaterialApp(
        title: 'Notes App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: HomePage(), 
      ),
    );
  }
}
