import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/Components/Customappbar.dart';
import 'package:pink_ribbon/views/educationpage/components/headrow.dart';
import 'package:pink_ribbon/views/educationpage/components/syptoms_bullets.dart';

class EarlyDetection extends StatefulWidget {
  const EarlyDetection({super.key});

  @override
  State<EarlyDetection> createState() => _EarlyDetectionState();
}

class _EarlyDetectionState extends State<EarlyDetection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Education"),
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
            educationHeadRow(
                title: "Early Detection",
                content:
                    "Check out this information about Early Detection of Breast Cancer! \n\nhttps://pinkribbon.org.pk/early-detection-techniques/"),
            SizedBox(height: 30.h),
            Text(
              "Ultrasound",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Ultrasound is used to target a specific area of concern found on the mammogram. Ultrasound helps distinguish between cysts (fluid-filled sacs) and solid masses, and sometimes can help differentiating between benign and cancerous tumours. Ultrasound may be most helpful in women with very dense breasts. Clinical trials are now looking at the benefits and risks of adding breast ultrasound to screening mammograms in women with dense breasts and a higher risk of breast cancer.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Mammogram",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Women age 40 and older should have a screening mammogram every year and should continue to do so for as long as they are in good health. Mammograms for older women should be based on the individual, her health, and other serious illnesses, such as congestive heart failure, end-stage renal disease, chronic obstructive pulmonary disease, and moderate-to-severe dementia. Age alone should not be the reason to stop having regular mammograms. As long as a woman is in good health and would be a candidate for treatment, she should continue to be screened with a mammogram.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "MRI",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Women at high risk for breast cancer based on certain factors should get an MRI and a mammogram every year. This includes women who:",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Have a lifetime risk of breast cancer of about 20% to 25% or greater, according to risk assessment tools that are based mainly on family history.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Have a known BRCA1 or BRCA2 gene mutation.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Have a first-degree relative (parent, brother, sister, or child) with a BRCA1 or BRCA2 gene mutation, but have not had genetic testing themselves.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Biopsy",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "A biopsy is done when mammograms, other imaging tests, or the physical exam finds a breast change (or abnormality) that is possibly cancer. A biopsy is the only way to confirm if cancer is present.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "During a biopsy, a sample of the suspicious area is removed to be looked at under a microscope, by a specialized doctor with many years of training called a pathologist. The pathologist sends your doctor a report that gives a diagnosis for each sample taken. Information in this report will be used to help manage your care.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 16.h),
            Divider(
              thickness: 1.h,
              color: AppColors.kAppBarGrey,
            ),
            SizedBox(height: 10.h),
            Text(
              "Coping With Diagnosis",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Once you are diagnosed with Breast Cancer, you may undergo emotional strain. To cope with it, do the following:",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            const BulletList(
              items: [
                "It’s natural to be anxious when you’re coping with a potentially life-threatening illness. To manage it, do not lose hope and try to keep the company of your loved ones around",
                "There are many ways to find help to cope with the emotional impact of breast cancer. Friends and family can offer support, or you could speak to your doctor",
                "Don’t be afraid to ask for support from those who care about you. It can help to talk about your feelings and try not to distance yourself from people",
                "Talk to other people affected by breast cancer and survivors",
                "For some people, talking to others who are in a similar situation can help to decrease feelings of anxiety, isolation or fear. You may want to consider meeting face to face with people in a similar situation",
                "Regular physical activity has many health benefits, but it can also help improve your mood and reduce anxiety and depression",
                "Eating a healthy diet and getting enough sleep may also help you cope better with stress",
              ],
            ),
            SizedBox(height: 50.h),
          ],
        ),
      )),
    );
  }
}
