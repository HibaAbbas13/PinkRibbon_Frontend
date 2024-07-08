import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/Components/Customappbar.dart';
import 'package:pink_ribbon/views/educationpage/components/bullets.dart';
import 'package:pink_ribbon/views/educationpage/components/headrow.dart';
import 'package:pink_ribbon/views/educationpage/components/richtext.dart';

class Stages extends StatefulWidget {
  const Stages({super.key});

  @override
  State<Stages> createState() => _StagesState();
}

class _StagesState extends State<Stages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Education",
      ),
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
                title: "Stages",
                content:
                    "Check out this information about Stages of Breast Cancer! \n\nhttps://pinkribbon.org.pk/stages-of-breast-cancer/"),
            SizedBox(height: 30.h),
            Text(
              "A stage is usually expressed as a number on a scale of 0 through IV — with stage 0 describing non-invasive cancers that remain within their original location and stage IV describing invasive cancers that have spread outside the breast to other parts of the body.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Stage 0",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Stage 0 is used to describe non-invasive breast cancers, such as DCIS (ductal carcinoma in situ). In stage 0, there is no evidence of cancer cells or non-cancerous abnormal cells breaking out of the part of the breast in which they started, or getting through to or invading neighbouring normal tissue.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Stage 1",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "In Stage I invasive breast cancer (cancer cells are breaking through or invading normal surrounding breast tissue) Stage I is divided into subcategories known as IA and IB",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            customRichText(
                'Stage IA ', 'describes invasive breast cancer in which:'),
            bullets("The tumour measures up to 2 centimetres AND"),
            bullets(
                "Cancer has not spread outside the breast; no lymph nodes are involved"),
            SizedBox(height: 10.h),
            customRichText(
                'Stage IB ', 'describes invasive breast cancer in which:'),
            bullets(
                "There is no tumour in the breast; instead, small groups of cancer cells – larger than 0.2 millimetres but not larger than 2 millimetres – are found in the lymph nodes OR"),
            bullets(
                "There is a tumour in the breast that is no larger than 2 centimetres, and there are small groups of cancer cells – larger than 0.2 millimetres but not larger than 2 millimetres – in the lymph nodes"),
            SizedBox(height: 10.h),
            Text(
              "Stage II",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Stage II is divided into subcategories known as IIA and IIB.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            customRichText(
                'Stage IIA ', 'describes invasive breast cancer in which:'),
            bullets(
                "No tumour can be found in the breast, but cancer (larger than 2 millimetres) is found in 1 to 3 axillary lymph nodes (the lymph nodes under the arm) or in the lymph nodes near the breastbone (found during a sentinel node biopsy) OR"),
            bullets(
                "A tumour measures 2 centimetres or smaller and has spread to the axillary lymph nodes OR"),
            bullets(
                "A tumour measures 2 centimetres or smaller and has spread to the axillary lymph nodes OR"),
            SizedBox(height: 10.h),
            customRichText(
                'Stage IIB ', 'describes invasive breast cancer in which:'),
            bullets(
                "A tumour is larger than 2 centimetres but no larger than 5 centimetres; small groups of breast cancer cells — larger than 0.2 millimetres but not larger than 2 millimetres — are found in the lymph nodes OR"),
            bullets(
                "A tumour is larger than 2 centimetres but not larger than 5 centimetres; cancer has spread to 1 to 3 axillary lymph nodes or lymph nodes near the breastbone (found during a sentinel node biopsy) OR"),
            bullets(
                "A tumour is larger than 5 centimetres but has not spread to the axillary lymph nodes"),
            SizedBox(height: 10.h),
            Text(
              "Stage III",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Stage III is divided into subcategories known as IIIA, IIIB, and IIIC.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            customRichText('Stage IIIA ',
                'describes invasive breast cancer in which either:'),
            bullets(
                "No tumour is found in the breast or a tumour may be any size; cancer is found in 4 to 9 axillary lymph nodes or in the lymph nodes near the breastbone (found during imaging tests or a physical exam) OR"),
            bullets(
                "A tumour is larger than 5 centimetres; small groups of breast cancer cells (larger than 0.2 millimetres but not larger than 2 millimetres) are found in the lymph nodes OR"),
            bullets(
                "A tumour is larger than 5 centimetres; cancer has spread to 1 to 3 axillary lymph nodes or to the lymph nodes near the breastbone (found during a sentinel lymph node biopsy)"),
            SizedBox(height: 10.h),
            customRichText(
                'Stage IIIB ', 'describes invasive breast cancer in which:'),
            bullets(
                "A tumour may be any size and has spread to the chest wall and/or skin of the breast and caused swelling or an ulcer AND"),
            bullets("It May have spread to up to 9 axillary lymph nodes OR"),
            bullets("It May have spread to lymph nodes near the breastbone"),
            SizedBox(height: 10.h),
            customRichText(
                'Stage IIIC ', 'describes invasive breast cancer in which:'),
            bullets(
                "There may be no sign of cancer in the breast or, if there is a tumour, it may be any size and may have spread to the chest wall and/or the skin of the breast AND"),
            bullets("Cancer has spread to 10 or more axillary lymph nodes OR"),
            bullets(
                "Cancer has spread to lymph nodes above or below the collarbone OR"),
            bullets(
                "Cancer has spread to axillary lymph nodes or lymph nodes near the breastbone"),
            SizedBox(height: 10.h),
            Text(
              "Stage IV",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Stage IV describes invasive breast cancer that has spread beyond the breast and nearby lymph nodes to other organs of the body, such as the lungs, distant lymph nodes, skin, bones, liver, or brain.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "You may hear the words “advanced” and “metastatic” used to describe stage IV breast cancer. Cancer may be stage IV at first diagnosis, or it can be a recurrence of previous breast cancer that has spread to other parts of the body.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      )),
    );
  }
}
