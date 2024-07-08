import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';


class ProfileTextField extends StatefulWidget {
  final String label;
  final bool isDropdown;
   final TextEditingController controller;
  const ProfileTextField({
    super.key,
    this.isDropdown = false,
    required this.label, required this.controller,
  });

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTypography.kExtraLight12.copyWith(color: AppColors.kBlack),
        ),
        SizedBox(
          height: 15.h,
        ),
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(14.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: BorderSide(color: AppColors.kGrey, width: 1.0.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: BorderSide(color: AppColors.kGrey, width: 1.0.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: BorderSide(color: AppColors.kPrimary, width: 1.0.w),
            ),
            
            suffixIcon: widget.isDropdown
                ? IconButton(
                    onPressed: () {},
                    icon:  Icon(Icons.keyboard_arrow_down, color: AppColors.kGrey)
                    
                  )
                : null
          ),
           style: AppTypography.kSemiBold14.copyWith(color: AppColors.kBlack),
        ),
      ],
    );
  }
}
