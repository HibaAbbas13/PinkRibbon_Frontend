import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/model/faq_model.dart';
import 'package:pink_ribbon/views/Components/Customappbar.dart';
import 'package:pink_ribbon/views/educationpage/components/faq_widget.dart';
import 'package:pink_ribbon/views/educationpage/components/headrow.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  // int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Education",
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45.h,
            ),
            educationHeadRow(
                title: "FAQs",
                content:
                    "Check out this information about FAQs of Breast Cancer! \n\nhttps://pinkribbon.org.pk/faqs/"),
            SizedBox(height: 30.h),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: faqItem.length,
              itemBuilder: (BuildContext context, int index) {
                // final isSelected = index == _selectedIndex;
                return InkWell(
                  onTap: () {
                    // setState(() {
                    //     _selectedIndex = index;
                    //   });
                  },
                  child: CustomFaq(
                    faqItem: faqItem[index],
                    //  isSelected: isSelected,
                  ),
                );
              },
            ),
            SizedBox(height: 50.h),
          ],
        ),
      )),
    );
  }
}
