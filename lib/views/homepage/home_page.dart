import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pink_ribbon/data/app_assets.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/model/Testimonial_model.dart';

import 'package:pink_ribbon/views/Notifications/NotificationScreen.dart';
import 'package:pink_ribbon/views/homepage/components/banner_card.dart';
import 'package:pink_ribbon/views/homepage/components/testimonial.dart';
import 'package:pink_ribbon/views/profilePage/profile_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController();

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset(
          AppAssets.kLogo,
          width: 120.w,
          height: 80.h,
          fit: BoxFit.cover,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ));
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
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(
                height: 55.h,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 22.0.w),
              //   child: Card(
              //     elevation: 3,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0.r),
              //     ),
              //     child: TextField(
              //       decoration: InputDecoration(
              //         contentPadding: EdgeInsets.zero,
              //         filled: true,
              //         fillColor: AppColors.kWhite,
              //         hintText: 'Search',
              //         hintStyle: AppTypography.kSemiBold14
              //             .copyWith(color: AppColors.kPrimary),
              //         prefixIcon: Padding(
              //           padding: EdgeInsets.only(left: 8.0.w),
              //           child: Icon(
              //             Icons.search,
              //             color: AppColors.kPrimary,
              //             size: 26,
              //           ),
              //         ),
              //         border: InputBorder.none,
              //         focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(30.r),
              //             borderSide: BorderSide.none),
              //         enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(30.r),
              //             borderSide: BorderSide.none),
              //         disabledBorder: const OutlineInputBorder(),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 35.h,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                child: CarouselSlider(
                    carouselController: carouselController,
                    items: [
                      BannerCard(imagePath: AppAssets.kHospital2),
                      BannerCard(imagePath: AppAssets.kHospital1),
                      BannerCard(imagePath: AppAssets.kHospital3),
                    ],
                    options: CarouselOptions(
                      //autoPlay: true,
                      height: 195.h,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      onPageChanged: (index, reason) => {
                        setState(
                          () {
                            current = index;
                          },
                        )
                      },
                    )),
              ),
              SizedBox(
                height: 14.h,
              ),
              DotsIndicator(
                dotsCount: 3,
                decorator: DotsDecorator(
                    color: AppColors.kAppBarGrey,
                    activeColor: AppColors.kAppBarPink,
                    activeSize: const Size.square(12),
                    spacing: EdgeInsets.all(2.h)),
                position: current,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0.w),
                child: Text(
                  '"And whoever saves a life, it will be as if they saved all \nof humanity."',
                  style: AppTypography.kSemiBold18.copyWith(
                    color: AppColors.kGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 30.0.w),
                  child: Text(
                    "Al Quran - 5:32",
                    style: AppTypography.kLight14.copyWith(
                      color: AppColors.kAppBarPink,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 285.h,
                  viewportFraction: 0.7,
                  initialPage: 1,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.15,
                ),
                itemCount: testimonialItem.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) =>
                        TestimonialCard(
                  testimonialItem: testimonialItem[index],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
