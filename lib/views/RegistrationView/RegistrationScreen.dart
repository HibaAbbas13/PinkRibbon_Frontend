import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pink_ribbon/views/Auth/LoginScreen.dart';
import 'package:pink_ribbon/views/landingpage/landing_page.dart';

import '../../data/app_colors.dart';
import '../../data/typography.dart';
import '../Auth/SignUpScreen.dart';
import '../Components/CommonButton.dart';

class ResgistrationView extends StatefulWidget {
  const ResgistrationView({super.key});

  @override
  State<ResgistrationView> createState() => _ResgistrationViewState();
}

class _ResgistrationViewState extends State<ResgistrationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
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
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 84.h,
          ),
          Text(
            'PINKRIBBON',
            style: AppTypography.kBold16.copyWith(color: AppColors.kPrimary),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 13.h,
          ),
          Text(
            'UNITED AGAINST BREAST CANCER',
            style:
                AppTypography.kSemiBold18.copyWith(color: AppColors.kPrimary),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 400.h,
            width: 300.w,
            child: Lottie.asset(
              'animations/Animation - 1716562618779.json',
              //    fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          CommomButton(
            text: "Create Account ",
            color: AppColors.kBackgroundPink2,
            color2: AppColors.kPrimary,
            border: Border.all(color: AppColors.kBackgroundPink2, width: 0),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpScreen()));
            },
          ),
          SizedBox(
            height: 13.h,
          ),
          CommomButton(
            text: "Login ",
            color: AppColors.kWhite,
            color2: AppColors.kPrimary,
            border: Border.all(color: AppColors.kBackgroundPink2, width: 1),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          ),
        ],
      ),
    ));
  }
}
