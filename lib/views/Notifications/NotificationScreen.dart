import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Future<List<Map<String, dynamic>>> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = DatabaseHelper().getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 28,
              color: AppColors.kAppBarGrey,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Notifications",
            style:
                AppTypography.kSemiBold18.copyWith(color: AppColors.kPrimary),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
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
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _notifications,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No notifications'));
              } else {
                final notifications = snapshot.data!;
                return ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return ListTile(
                      title: Text(notification['title'] ?? 'No Title',
                          style: AppTypography.kBold14.copyWith(
                            color: AppColors.kPrimary,
                          )),
                      subtitle: Text(notification['body'] ?? 'No Body',
                          style: AppTypography.kSemiBold12.copyWith(
                            color: AppColors.kGrey,
                          )),
                      trailing: Text(notification['receivedAt'] ?? '',
                          style: AppTypography.kLight10.copyWith(
                            color: AppColors.kPrimary,
                          )),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
