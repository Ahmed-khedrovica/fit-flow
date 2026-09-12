import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore;

  FirebaseFirestoreService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCollection(
    String collectionPath,
  ) async {
    final querySnapshot = await _firestore.collection(collectionPath).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<Map<String, dynamic>?> getDocument(
    String collectionPath,
    String documentId,
  ) async {
    final docSnapshot = await _firestore
        .collection(collectionPath)
        .doc(documentId)
        .get();
    return docSnapshot.data();
  }

  Future<List<Map<String, dynamic>>> getDocumentsByQuery(
    String collectionPath,
    Object field,
    Object value,
  ) async {
    final querySnapshot = await _firestore
        .collection(collectionPath)
        .where(field, isEqualTo: value)
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
