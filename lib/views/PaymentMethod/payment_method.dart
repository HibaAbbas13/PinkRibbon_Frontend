import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/model/Payment_model.dart';
import 'package:pink_ribbon/views/Components/Customappbar.dart';

import 'package:pink_ribbon/views/PaymentMethod/components/payment_card.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Donate',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(
            28.w,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.kBackgroundPink1.withOpacity(0.4),
                AppColors.kBackgroundPink2.withOpacity(0.5),
                AppColors.kBackgroundPink1.withOpacity(0.4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Select any Payment Method",
                style: AppTypography.kLight14
                    .copyWith(color: AppColors.kAppBarPink),
              ),
              SizedBox(
                height: 40.h,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.h,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: methodItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return PaymentCard(
                    methodItem: methodItem[index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
