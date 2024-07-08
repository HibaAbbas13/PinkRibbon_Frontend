import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/Components/Customappbar.dart';
import 'package:pink_ribbon/views/educationpage/components/headrow.dart';
import 'package:pink_ribbon/views/educationpage/components/syptoms_bullets.dart';


class Symptoms extends StatefulWidget {
  const Symptoms({super.key});

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Education",),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45.h,
            ),
            educationHeadRow(title: "Symptoms", content: "Check out this information about Symptoms of Breast Cancer! \n\nhttps://pinkribbon.org.pk/signs-symptoms/"),
            SizedBox(height: 30.h),
            Text(
              "Women experience breast changes in size, texture and shape during her lifetime. Sometimes they feel pain or tenderness, especially during breastfeeding and menopause. Most of the time there is nothing to fear about these changes but sometimes these changes occur due to breast cancer. Some changes are warning signs of breast cancer and women should not ignore these signs to catch breast cancer at an early stage. Early detection of breast cancer is the key to survival because if breast cancer is diagnosed early the chances of survival are up to 90%.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "For every woman these warning signs are different but there are some common warning signs that you can look out for. The most common symptom of breast cancer is a new lump or a mass that is painless, hard, and has irregular edges is more likely to be cancerous, but it can be tender, soft, or rounded and can even be painful.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Breast Cancer signs include the following",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            const BulletList(
              items: [
                "Scaliness, lumping or thickening of the nipple or breast skin",
                "Swelling of all or part of a breast (even if no distinct lump is felt)",
                "Change in breast shape",
                "A sudden increase in breast size",
                "Breast heaviness (one more than the other)",
                "Firmness or hardening of one breast",
                "Skin dimpling",
                "Lump, Swollen lymph nodes or pain in the armpit or above the collarbone",
                "Redness, orange-peel skin or change in skin texture",
                "Skin irritation (constantly itching breast skin)",
                "Nipple discharge other than breast milk",
                "Nipple retraction (turning inward)",
                "Change in how the nipple looks",
                "Change in the direction of the nipple",
                "Breast or nipple pain other than your menstrual cycle",
                "The warmth of one breast",
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              "Anyone who notices any of these changes should see a doctor immediately. Young girls and women should do self-examination at least once in a month. It is suggested that women between 25 and 40 years old who are asymptomatic and have no special risk factors for breast cancer undergo a clinical breast exam every 1 to 3 years. The risk of getting breast cancer increases for the women ages above 40 so they are recommended to receive more frequent clinical breast exams. Women ages above 40 should have a mammogram screening each year to diagnose breast cancer at its earliest and most treatable stage because in some cases breast cancer may not cause any symptoms.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            
            SizedBox(height: 50.h),
          ],
        ),
      )),
    );
  }
}
