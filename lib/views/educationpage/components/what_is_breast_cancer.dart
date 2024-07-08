import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/Components/Customappbar.dart';
import 'package:pink_ribbon/views/educationpage/components/headrow.dart';


class BreastCancer extends StatefulWidget {
 
  const BreastCancer({super.key});

  @override
  State<BreastCancer> createState() => _BreastCancerState();
}

class _BreastCancerState extends State<BreastCancer> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(title: "Education", ),
      
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
            educationHeadRow(title: "What is Breast Cancer", content: "Check out this information about What is Breast Cancer! \n\nhttps://pinkribbon.org.pk/what-is-breast-cancer/"),
            SizedBox(height: 30.h),
            Text(
              "Cells in the body normally divides at a steady and even pace. Human body continuously forms New cells to take the place of old and injured cells. Sometimes, however, when cells divide and multiply rapidly, they form a lump also called a tumour. Nearly 80% of finding on a mammogram are not cancer. They are usually benign tumours, a cyst or some other non-cancerous condition. A tumour is called cancer only when it starts invading nearby tissues and organs and damage them.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Types of Breast Cancer",
              style: AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            
            
            SizedBox(height: 10.h),
            Text(
              "Your diagnosis will tell you the name of the condition you have. It is important to remember that most of the lumps will be a benign (non-cancerous) condition.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            
            SizedBox(height: 10.h),
            Text(
              "If you are diagnosed with breast cancer, this may be described as non-invasive, primary or secondary cancer.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Non-invasive cancer",
              style: AppTypography.kSemiBold14.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Non-invasive cancers are cancerous changes that are contained within the breast ducts or lobules; for example, Ductal Carcinoma In Situ (DCIS) or Lobular Carcinoma In Situ (LCIS).",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Invasive cancer ",
              style: AppTypography.kSemiBold14.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Primary cancer, also known as invasive cancer, is a tumour that grows outside the ducts and lobules into the surrounding breast tissue.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Metastatic cancer",
              style: AppTypography.kSemiBold14.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Secondary breast cancer, or metastatic breast cancer, is when cells from the breast tumour spread to other parts of the body, starting with the axillary lymph nodes under the armpit, and then form tumours in other locations such as the bone or the brain.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            
            SizedBox(height: 12.h),
            Text(
              "Before deciding on treatment, your doctor will also look at the stage of your cancer – what size it is and how much it has spread, and the grade – how different the cancer cells are from normal breast cells and how fast they are growing.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            
            SizedBox(height: 50.h),
            
          ],
        ),
      )),
    );
  }

  
}
