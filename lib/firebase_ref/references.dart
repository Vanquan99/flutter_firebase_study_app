import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
final userRF = fireStore.collection('users');
final questionPaperRF = fireStore.collection('questionPapers');

Reference get firebaseStorage => FirebaseStorage.instance.ref();

DocumentReference questionRF({
  required String paperId,
required String questionId,
})=> questionPaperRF.doc(paperId).collection('questions').doc(questionId);

