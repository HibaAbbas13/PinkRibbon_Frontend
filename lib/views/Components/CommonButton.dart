import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/typography.dart';

class CommomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color color2;
  final Border border;
  final VoidCallback onTap;

  const CommomButton({
    super.key,
    required this.text,
    required this.color,
    required this.color2,
    required this.border,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 55.h,
            width: 342.w,
            decoration: BoxDecoration(
                border: border,
                borderRadius: BorderRadius.circular(26),
                color: color),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                      style: AppTypography.kSemiBold16.copyWith(color: color2)),
                ],
              ),
            )));
  }
}
