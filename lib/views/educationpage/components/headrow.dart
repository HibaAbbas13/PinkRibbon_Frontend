import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:share_plus/share_plus.dart';

Row educationHeadRow({required String title, required String content}) {
  void shareContent() {
  // Define the content you want to share, such as the page title and some details
  String shareContent = content;

  // Share the content using the share package
  Share.share(shareContent);
}
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: AppColors.kPrimary,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Text(
          title,
          style: AppTypography.kBold16.copyWith(color: AppColors.kWhite),
        ),
      ),
      InkWell(
        onTap: () {
                      shareContent(); // Call the function to share content
                    },
        child: Icon(
          Icons.share,
          color: AppColors.kPrimary,
        ),
      ),
    ],
  );
}
