import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/Components/Customappbar.dart';
import 'package:pink_ribbon/views/educationpage/components/bullets.dart';
import 'package:pink_ribbon/views/educationpage/components/headrow.dart';


class Treatment extends StatefulWidget {
  const Treatment({super.key});

  @override
  State<Treatment> createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
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
            educationHeadRow(title: "Treatment", content: "Check out this information about Traeatment of Breast Cancer! \n\nhttps://pinkribbon.org.pk/treatment/"),
            SizedBox(height: 30.h),
            Text(
              "When a diagnosis of breast cancer has been made, your doctor will discuss the best treatment for you, the timing of your treatment, and any potential side effects. Your diagnosis and treatment decisions will be influenced by factors such as your general health and personal choice.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Surgery",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Surgery is usually the first treatment and is used to remove cancerous tissue from the breast. The surgery offered will depend on the type of cancer, its size, where it is in the breast and how much of the surrounding tissue needs to be removed.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "The surgeries offered include a lumpectomy (also known as a wide local excision) or a mastectomy:",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 4.h),
            bullets("A lumpectomy, or wide local excision, involves removing cancer and a small amount (margin) of normal tissue around it"),
            bullets("A mastectomy involves the removal of the entire breast; a modified radical mastectomy also involves removing some of the lymph under the armpit and some muscle from the chest wall"),
            SizedBox(height: 10.h),
            Text(
              "Radiotherapy",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Radiotherapy involves destroying cancer cells with a targeted, carefully measured dose of radiation.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "The treatment is usually used to kill any remaining cancer cells after surgery or to reduce the size of a tumour before surgery.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Radiotherapy can also be used to help reducing pain and other symptoms when breast cancer has spread to the bone, brain or lungs.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Chemotherapy",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Chemotherapy is a treatment that uses chemicals to destroy cancer cells by targeting rapidly dividing cells in the body.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Chemotherapy can be used before surgery to shrink large tumours, after surgery to kill cancer cells that may have spread to other parts of the body, or independently of surgery to slow the growth of secondary cancer.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "As chemotherapy is not specific to cancer cells, it can destroy other rapidly dividing cells such as hair follicles and the lining of the gut, and this causes some side effects associated with treatment such as hair loss and nausea.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Treatment is given in the form of tablets or by injection every two to four weeks over a four to six-month period.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Anti-Hormone Therapy",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Some breast cancers are stimulated to grow by the hormone estrogen, which attaches to receptors on the surface of cancer cells. These cancers are known as estrogen receptor positive (ER+).",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Anti-hormone therapies block estrogen from binding with estrogen receptors, or stop the body from producing estrogen altogether.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            Text(
              "Treatment is taken as a tablet once a day to reduce the long-term risk of breast cancer coming back after surgery or chemotherapy.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Tests can also be done to see if cancer cells are progesterone receptor positive (PR+), although the benefits of anti-hormone therapy for cancers that are only progesterone receptor positive is less clear.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            
            Text(
              "Targeted Therapy",
              style:
                  AppTypography.kSemiBold16.copyWith(color: AppColors.kPrimary),
            ),
            SizedBox(height: 10.h),
            Text(
              "Targeted therapies are a group of drugs that block the growth and spread of cancer by targeting specific molecules present in cancer cells.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Because these treatments are specific to cancer cells, they may be less harmful to normal cells and so can have fewer side effects.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "The most well-known targeted treatment for breast cancer is Herceptin (trastuzumab), which is given to people with abnormally high levels of the protein HER2. These HER2 positive or HER2+ cancer cells are found in around 20 per cent of breast cancers patients.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 10.h),
            Text(
              "Herceptin is given in the form of targeted therapy and can be given after surgery or chemotherapy, or at the same time as chemotherapy, to reduce the chances of breast cancer coming back or spreading.",
              style: AppTypography.kLight14.copyWith(height: 1.6.h),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      )),
    );
  }
}
