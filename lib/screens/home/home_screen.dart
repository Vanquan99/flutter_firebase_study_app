import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_app/screens/home/question_card.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'menu_screen.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName='/home';

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    // QuizPaperController quizPaperController = Get.find();

    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_){
        return ZoomDrawer(
          borderRadius: 50,
          controller: _.zoomDrawerController,
          showShadow: false,
          // moveMenuScreen: false,
          angle: 0,
          style: DrawerStyle.defaultStyle,
          // menuBackgroundColor: ,
          // menuBackgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width*0.7,
          menuScreen: const MyMenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            // color: Colors.blueAccent,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          onTap: controller.toggleDrawer,
                          child: const Icon(Icons.menu, size: 30,),
                        ),
                        // const Icon(AppIcons.menuLeft,),
                        const SizedBox(
                          height: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              // const Icon(AppIcons.peace,),
                              const Icon(Icons.perm_identity),
                              Text(
                                'Hello Quan',
                                style:
                                detailText.copyWith(color: onSurfaceTextColor),
                              )
                            ],
                          ),
                        ),
                        const Text(
                          'What do you want to lean today?',
                          style: headerText,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(
                              () => ListView.separated(
                              padding: UIParameters.mobileScreenPadding,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCard(
                                  model: _questionPaperController.allPapers[index],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount: _questionPaperController.allPapers.length),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },)
    );
  }
}