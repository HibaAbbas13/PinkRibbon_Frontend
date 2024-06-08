import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/widgets/custom_appbar.dart';

class AboutUsPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const AboutUsPage({ super.key, required this.title, required this.description, required this.image });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: Container(
        margin: EdgeInsets.all(30.w),
        padding: EdgeInsets.symmetric(horizontal: 40.0.w),
        decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: AppColors.kPrimary)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
          SvgPicture.asset(
              image,
              height: 50.h,
              width: 50.w,
            ),
        
        SizedBox(height: 16.h,),
        Text(description,
        style: AppTypography.kLight12.copyWith(color: AppColors.kGrey),
        textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}