import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference note =
      FirebaseFirestore.instance.collection('note');

  Future updateNote(int id, String title, String data, String dateCreated,
      String dateUpdated, String tag) async {
    return await note.doc(uid).set({
      'id': id,
      'title': title,
      'data': data,
      'dateCreated': dateCreated,
      'dateUpdated': dateUpdated,
      'tag': tag,
    });
  }
}
