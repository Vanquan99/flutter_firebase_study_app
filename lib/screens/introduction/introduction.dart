import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/routes/app_routes.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient()
        ),
        alignment: Alignment.center,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 65,),
              const SizedBox(height: 40,),
              const Text('This is a study app. You can use it as you want...',
              style: TextStyle(
                fontSize: 18,
                color: onSurfaceTextColor,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 40,),

              AppCircleButton(
                child: const Icon(Icons.arrow_forward, size: 35,),
                onTap: ()=> Get.offAndToNamed("/home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
