import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/Notifications/NotificationScreen.dart';

import 'package:pink_ribbon/views/profilePage/profile_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool main;
  const CustomAppBar({
    super.key,
    required this.title,
    this.main = false,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kWhite,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: main
            ? const Icon(null)
            : Icon(
                Icons.arrow_back_ios_new,
                size: 28,
                color: AppColors.kAppBarGrey,
              ),
      ),
      centerTitle: true,
      title: Text(title,
          style: AppTypography.kSemiBold18.copyWith(color: AppColors.kPrimary)),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    NotificationScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
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
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ProfilePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 8.w),
            child: Icon(
              Icons.account_circle_outlined,
              size: 28,
              color: AppColors.kAppBarGrey,
            ),
          ),
        ),
      ],
    );
  }
}
