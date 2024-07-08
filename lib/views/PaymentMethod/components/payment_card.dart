import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/model/Payment_model.dart';
import 'package:pink_ribbon/providers/Transaction_provider.dart';
import 'package:pink_ribbon/views/PaymentMethod/bank_page.dart';
import 'package:provider/provider.dart';

class PaymentCard extends StatelessWidget {
  final PaymentModel methodItem;
  const PaymentCard({super.key, required this.methodItem});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) => TransactionProvider(),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BankPage(
                username: methodItem.title,
                useraccount: methodItem.accountNo,
                amount: methodItem.iban,
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          // margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: AppColors.kWhite),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                methodItem.title,
                style: AppTypography.kLight14.copyWith(color: AppColors.kBlack),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(methodItem.image),
                    fit: BoxFit
                        .contain, // Adjust the fit as per your requirement
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
