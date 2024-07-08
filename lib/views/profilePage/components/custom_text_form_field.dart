import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/Auth/Components/Validation.dart';

class ProfileTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String label;
  const ProfileTextFormField({
    super.key,
    required this.controller,
    this.isPassword = false,
    required this.label,
  });

  @override
  State<ProfileTextFormField> createState() => _ProfileTextFormFieldState();
}

class _ProfileTextFormFieldState extends State<ProfileTextFormField> {
  bool isObscure = true;

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
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? isObscure : false,
          validator: (value) {
            if (widget.isPassword) {
              return CustomValidator.validatePassword(value);
            } else {
              return CustomValidator.validateUsername(value);
            }
          },
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            errorStyle:
                AppTypography.kLight12.copyWith(color: AppColors.kPrimary),
            contentPadding: EdgeInsets.all(14.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide:
                  BorderSide(color: AppColors.kAppBarGrey, width: 1.0.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide:
                  BorderSide(color: AppColors.kAppBarGrey, width: 1.0.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: BorderSide(color: AppColors.kPrimary, width: 1.0.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide: BorderSide(color: AppColors.kPrimary, width: 1.0.w),
            ),
          ),
          style: AppTypography.kLight14.copyWith(color: AppColors.kBlack),
        ),
      ],
    );
  }
}
