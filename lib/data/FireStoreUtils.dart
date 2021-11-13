import 'package:cloud_firestore/cloud_firestore.dart';

import 'ToDo.dart';

Future<void> AddToFireStore(
    String title, String description, DateTime datetime) {
  CollectionReference<ToDo> collectionReference =
      get_ToDo_Collection_With_Converter();

  DocumentReference<ToDo> DocRef = collectionReference.doc();

  ToDo item = ToDo(
      id: DocRef.id,
      title: title,
      description: description,
      datetime: datetime);
  return DocRef.set(item); // Future of void function
}

Future<void> deleteToDo(ToDo item) {
  CollectionReference<ToDo> collectionReference =
      get_ToDo_Collection_With_Converter();
  DocumentReference<ToDo> itemDoc = collectionReference.doc(item.id);
  return itemDoc.delete();
}

CollectionReference<ToDo> get_ToDo_Collection_With_Converter() {
  return FirebaseFirestore.instance
      .collection(ToDo.collectionName)
      .withConverter<ToDo>(
        // FROM FireStore Documentation
        fromFirestore: (snapshot, _) => ToDo.fromJson(snapshot.data()!),
        toFirestore: (item, _) => item.toJson(),
      );
}
