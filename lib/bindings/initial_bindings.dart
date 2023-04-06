import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/controllers/theme_controller.dart';
import 'package:get/get.dart';

import '../services/firebase_storage_services.dart';



class InitialBindings implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController(), permanent: true);
    Get.put(ThemeController());
    Get.put(FirebaseStorageService());
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true);
    // Get.put(NotificationService());
  }

}