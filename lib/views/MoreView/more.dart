import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pink_ribbon/data/AppIcons.dart';

import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/MoreView/components/about_us.dart';
import 'package:pink_ribbon/views/MoreView/components/founder_page.dart';
import 'package:pink_ribbon/views/profilePage/profile_view.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../data/app_assets.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        centerTitle: true,
        title: Text("More",
            style:
                AppTypography.kSemiBold18.copyWith(color: AppColors.kPrimary)),
        actions: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const NotificationPage(),
              //     ));
            },
            child: Icon(
              Icons.notifications_none_rounded,
              size: 28,
              color: AppColors.kAppBarGrey,
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.only(right: 16.w, left: 8.w),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 28,
                  color: AppColors.kAppBarGrey,
                ),
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 70.h),
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
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsPage(
                        image: AppIcons.kVision,
                        title: 'About Us',
                        description:
                            'Pink Ribbon Pakistan is a non-funded, self-sustained and the only organization in the country which is dedicatedly working on the issue of breast cancer with nationwide outreach since 2004.We strive to significantly reduce breast cancer mortality in the country by creating widespread awareness through community engagement on prevention, early detection and increased access to treatment.Our scope of work is holistic from strategic interventions to public awareness including patient-aid and service delivery.To provide relief to poor people, we are setting up a dedicated Breast Cancer Hospital where deserving patients will get free of cost treatment under one roof.',
                      ),
                    ));
              },
              contentPadding: EdgeInsets.zero,
              dense: true,
              minLeadingWidth: 1,
              leading: SvgPicture.asset(
                AppIcons.kVision,
                height: 26.h,
                width: 26.w,
                color: AppColors.kPrimary,
              ),
              title: Text(
                'About US',
                style:
                    AppTypography.kLight12.copyWith(color: AppColors.kPrimary),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FounderMessagePage(),
                    ));
              },
              contentPadding: EdgeInsets.zero,
              dense: true,
              minLeadingWidth: 1,
              leading: Icon(
                Icons.message_outlined,
                color: AppColors.kPrimary,
              ),
              title: Text(
                "Founder's Message",
                style:
                    AppTypography.kLight12.copyWith(color: AppColors.kPrimary),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsPage(
                        image: AppIcons.kVision,
                        title: 'Mission',
                        description:
                            'Our mission is to prevent and cure breast cancer by creating widespread awareness through community engagement on prevention, early detection and increased access to treatment.',
                      ),
                    ));
              },
              contentPadding: EdgeInsets.zero,
              dense: true,
              minLeadingWidth: 1,
              leading: SvgPicture.asset(
                AppIcons.kVision,
                height: 26.h,
                width: 26.w,
                color: AppColors.kPrimary,
              ),
              title: Text(
                'Mission',
                style:
                    AppTypography.kLight12.copyWith(color: AppColors.kPrimary),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsPage(
                        image: AppIcons.kVision,
                        title: 'Vision',
                        description:
                            'We are envisioning a future where breast cancer victims will be treated with world class healthcare technology. We are setting up Pakistan’s first dedicated BREAST CANCER HOSPITAL in Lahore which will, significantly, reduce breast cancer mortality in Pakistan. In our Journey towards a cancer free Pakistan, we are committed to build more breast cancer hospitals in the future.',
                      ),
                    ));
              },
              contentPadding: EdgeInsets.zero,
              dense: true,
              minLeadingWidth: 1,
              leading: SvgPicture.asset(
                AppIcons.kVision,
                height: 26.h,
                width: 26.w,
                color: AppColors.kPrimary,
              ),
              title: Text(
                'Vision',
                style:
                    AppTypography.kLight12.copyWith(color: AppColors.kPrimary),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            ListTile(
              onTap: () {},
              contentPadding: EdgeInsets.zero,
              dense: true,
              minLeadingWidth: 1,
              leading: Icon(
                Icons.translate_sharp,
                color: AppColors.kPrimary,
              ),
              title: Text(
                'Language',
                style:
                    AppTypography.kLight12.copyWith(color: AppColors.kPrimary),
              ),
              trailing: ToggleSwitch(
                minWidth: 60.0.w,
                cornerRadius: 20.r,
                activeBgColors: [
                  [AppColors.kPrimary],
                  [AppColors.kPrimary]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: AppColors.kAppBarGrey,
                inactiveFgColor: Colors.white,
                initialLabelIndex: 1,
                totalSwitches: 2,
                labels: const ['Eng', 'اردو'],
                radiusStyle: true,
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(30.h),
                      title: const Text('Logout?'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.kAppBarGrey,
                            ),
                            child: Text(
                              'CANCEL',
                              style: AppTypography.kLight12
                                  .copyWith(color: AppColors.kBlack),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.kPrimary,
                            ),
                            child: Text(
                              'LOGOUT',
                              style: AppTypography.kLight12
                                  .copyWith(color: AppColors.kWhite),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              contentPadding: EdgeInsets.zero,
              dense: true,
              minLeadingWidth: 1,
              leading: Icon(
                Icons.logout,
                color: AppColors.kPrimary,
              ),
              title: Text(
                'Logout',
                style:
                    AppTypography.kLight12.copyWith(color: AppColors.kPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
