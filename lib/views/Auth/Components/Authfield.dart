import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/views/Auth/Components/Validation.dart';

class AuthField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final IconData icon;

  const AuthField({
    super.key,
    required this.controller,
    this.isPassword = false,
    required this.hintText,
    required this.icon,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;
  String? _errorMessage; // Define _errorMessage here

  void _togglePasswordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            contentPadding: const EdgeInsets.only(left: 37),
            hintText: widget.hintText,
            filled: true,
            fillColor: AppColors.kWhite,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26.r),
                borderSide: BorderSide(color: AppColors.kWhite, width: 1.w)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26.r),
                borderSide: BorderSide(color: AppColors.kWhite, width: 1.w)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26.0.r),
              borderSide: BorderSide(color: AppColors.kWhite, width: 1.0.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26.0.r),
              borderSide: BorderSide(color: AppColors.kWhite, width: 1.0.w),
            ),
            prefixIcon: Icon(
              widget.icon,
              size: 22.h,
              color: AppColors.kGrey,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        AppColors.kGreySvg,
                        BlendMode.srcIn,
                      ),
                      child: Icon(
                        isObscure
                            ? Icons.visibility_off
                            : Icons.remove_red_eye_rounded,
                        size: 22.h,
                        color: AppColors.kGrey,
                      ),
                    ),
                  )
                : null,
          ),
        ),
        if (_errorMessage != null)
          Text(
            _errorMessage!,
          ),
      ],
    );
  }
}
