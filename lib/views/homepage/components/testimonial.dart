import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/model/Testimonial_model.dart';



class TestimonialCard extends StatelessWidget {
  final TestimonialList testimonialItem;
  const TestimonialCard({required this.testimonialItem, super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
       shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r), 
          ),
      child: Container(
        width: 250.w,
        
        padding: EdgeInsets.all(10.0.h),
        decoration: BoxDecoration(
          color: AppColors.kLightGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(testimonialItem.image),
                    ),
                  ),
                ),
                Text(testimonialItem.name, style: AppTypography.kBold16.copyWith(color: AppColors.kAppBarPink)),
                Text("Treatment Duration",
                style: AppTypography.kLight12,
                ),
                 Text(testimonialItem.time, style: AppTypography.kLight14.copyWith(color: AppColors.kPrimary)),
                
              
              ],
            ),
             
          ],
        ),
      ),
    );
  }
}