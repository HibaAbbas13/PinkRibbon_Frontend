import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/model/EducationModel.dart';
import 'package:pink_ribbon/views/Components/Customappbar.dart';
import 'package:pink_ribbon/views/Notifications/NotificationScreen.dart';
import 'package:pink_ribbon/views/educationpage/components/EducationCard.dart';
import 'package:pink_ribbon/views/educationpage/components/early_detection.dart';
import 'package:pink_ribbon/views/educationpage/components/factors.dart';
import 'package:pink_ribbon/views/educationpage/components/faq.dart';
import 'package:pink_ribbon/views/educationpage/components/stages.dart';
import 'package:pink_ribbon/views/educationpage/components/symptoms.dart';
import 'package:pink_ribbon/views/educationpage/components/treatment.dart';
import 'package:pink_ribbon/views/educationpage/components/what_is_breast_cancer.dart';
import 'package:pink_ribbon/views/profilePage/profile_view.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({
    super.key,
  });

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final Map<int, Widget> pageMap = {
    0: const BreastCancer(),
    1: const Factors(),
    2: const Symptoms(),
    3: const Stages(),
    4: const EarlyDetection(),
    5: const Treatment(),
    6: const FAQs()
  };

  void navigateToPage(int index) {
    if (pageMap.containsKey(index)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pageMap[index]!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Education",
        main: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 22.w,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.kBackgroundPink1.withOpacity(0.4),
                AppColors.kBackgroundPink2.withOpacity(0.5),
                AppColors.kWhite,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 30.h),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: educationItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => navigateToPage(index),
                    child: EducationCard(
                      educationItem: educationItem[index],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
