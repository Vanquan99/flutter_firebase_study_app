import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/services/firebase_storage_services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = [
      'biology',
      'chemistry',
      'maths',
      'physics',
    ];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((imgName) => QuestionPaperModel.fromSnapshot(imgName))
          .toList();
      allPapers.assignAll(paperList);

      for(var paper in paperList){
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl= imgUrl;
        // allPaperImages.add(imgUrl!);
      }
      allPapers.assignAll(paperList);
      // QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      // final paperList = data.docs
      //     .map((paper) => QuestionPaperModel.fromSnapshot(paper))
      //     .toList();
      // allPapers.assignAll(paperList);
      //
      // for (var paper in paperList) {
      //   final imgUrl =
      //       await Get.find<FirebaseStorageService>().getImage(paper.title);
      //   paper.imageUrl = imgUrl;
      //   // allPaperImages.add(imgUrl!);
      // }
      // allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain =false}){

    AuthController _authController = Get.find();
    if(_authController.isLoggedIn()){
      if(tryAgain){
        Get.back();
        // Get.offAllNamed()
      } else{
        // Get.toNamed();
        print('logged in');
      }
    } else {
      print('The title is ${paper.title}');
      _authController.showLoginAlertDialog();

    }
  }
}
