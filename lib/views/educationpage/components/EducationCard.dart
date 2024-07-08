import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/model/EducationModel.dart';

class EducationCard extends StatelessWidget {
  final EducationModel educationItem;
  const EducationCard({required this.educationItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(26.h),
          decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.circular(30.r),
              border:
                  Border.all(color: AppColors.kBackgroundPink2, width: 1.w)),
          child: Column(
            children: [
              Text(
                educationItem.description,
                style: AppTypography.kLight14.copyWith(
                  height: 1.5, 
                  
                ),
                 textAlign: TextAlign.justify,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text("Read More",
                style: AppTypography.kLight10.copyWith(color: AppColors.kPrimary),
                ),
              )
            ],
          ),
          
        ),
        Positioned(
          left: 25.w,
          top: -9.h,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            decoration: BoxDecoration(
                color: AppColors.kPrimary,
                borderRadius: BorderRadius.circular(15.r)),
            child: Text(educationItem.title,
            style: AppTypography.kSemiBold14.copyWith(color: AppColors.kWhite),),
          ),
        )
      ],
    );
  }
}
