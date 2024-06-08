import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_assets.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/widgets/custom_appbar.dart';

class FounderMessagePage extends StatelessWidget {
 
  const FounderMessagePage({ super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Founder's Message"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30.w),
          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 45
          .h),
          decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: AppColors.kPrimary)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.kFaysal),
                    fit: BoxFit.contain, // Adjust the fit as per your requirement
                  ),
                ),
              ),
            
          SizedBox(height: 16.h,),
          Text('Mr. Omer Aftab',
          style: AppTypography.kBold14.copyWith(color: AppColors.kGrey),),
          SizedBox(height: 16.h,),
          Text('109 women die every 24 hours due to breast cancer in Pakistan. Over 40,000 deaths a year with an addition of 90,000 new breast cancer cases annually is a matter of serious concern. Although, timely diagnosis and proper treatment can increase survival chances of breast cancer patients up to 90%. From creating year-around nationwide breast cancer awareness to forming impactful alliances with the governments and private organizations to judicial advocacy through Supreme Court; Pink Ribbon has successfully transformed the tabooed topic of ‘breast cancer’ to an active ‘National Health Agenda’. On the other hand, we are building Pakistan’s 1st dedicated Breast Cancer Hospital which is now 60% complete. The hospital aims to provide world-class diagnosis and treatment services including OPD, Ultrasound, Mammogram, Chemotherapy, Surgery, and in-patient facility to 40,000 breast cancer patients annually. Pink Ribbon is a charity organization that purely depends on public philanthropy in the form of Zakat, Sadaqat, and Donations. We believe saving thousands of precious lives of mothers, sisters, and daughters is our collective responsibility. We urge you to step forward and help us timely complete the remaining 40% of Pakistan’s 1st dedicated Breast Cancer Hospital. Your help, however big or small, can turn a victim into a survivor. Wishing you and your loved ones health and peace.',
          style: AppTypography.kLight12.copyWith(color: AppColors.kGrey),
          textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}