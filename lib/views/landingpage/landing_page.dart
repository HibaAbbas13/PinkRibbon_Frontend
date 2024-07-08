import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pink_ribbon/data/AppIcons.dart';
import 'package:pink_ribbon/data/app_colors.dart';

import 'package:pink_ribbon/views/Vedio_Page/Vediopage.dart';
import 'package:pink_ribbon/views/donationPage/donation_page.dart';
import 'package:pink_ribbon/views/educationpage/education_page.dart';
import 'package:pink_ribbon/views/homepage/home_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pink_ribbon/views/MoreView/more.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    super.key,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  bool isSelected = false;

  Future<void> launchWhatsApp({
    required String phoneNumber,
    required String message,
  }) async {
    final String url =
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> pages = [
    const HomePage(),
    const EducationPage(),
    const DonationPage(),
     VideoListScreen(),
    const MorePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            isSelected = !isSelected;

            setState(() {
              launchWhatsApp(
                phoneNumber:
                    '+923338888335', // Replace with the phone number you want to message
                message: 'Hello,PinkRibbon!',
              );
            });
          },
          backgroundColor: AppColors.kFloatingGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            AppIcons.whatsapp,
            color: AppColors.kPrimary,
          )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.kPrimary,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: AppColors.kPrimary,
              size: 26,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: AppColors.kAppBarGrey,
              size: 26,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.menu_book_outlined,
              color: AppColors.kPrimary,
              size: 26,
            ),
            icon: Icon(
              Icons.menu_book_outlined,
              color: AppColors.kAppBarGrey,
              size: 26,
            ),
            label: 'Education',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.attach_money,
              color: AppColors.kPrimary,
              size: 26,
            ),
            icon: Icon(
              Icons.attach_money,
              color: AppColors.kAppBarGrey,
              size: 26,
            ),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.video_collection_rounded,
              color: AppColors.kPrimary,
              size: 26,
            ),
            icon: Icon(
              Icons.video_collection_outlined,
              color: AppColors.kAppBarGrey,
              size: 26,
            ),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.more_vert,
              color: AppColors.kPrimary,
              size: 26,
            ),
            icon: Icon(
              Icons.more_vert,
              color: AppColors.kAppBarGrey,
              size: 26,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
