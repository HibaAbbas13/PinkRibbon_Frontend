import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/views/Auth/Components/Authfield.dart';
import 'package:pink_ribbon/views/Auth/LoginScreen.dart';
import '../../../data/app_colors.dart';
import '../../Components/CommonButton.dart';

final _formKey = GlobalKey<FormState>();

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController emailController = TextEditingController();
  void _sendPasswordResetEmail() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = emailController.text;
    final url =
        'https://pinkribbon-afb2f3b6e998.herokuapp.com/api/user/send-reset-password-email';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password reset email sent successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send password reset email.')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 28,
            color: AppColors.kAppBarGrey,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(29.0.h),
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
              height: 30.h,
            ),
            Text(
              "Forgot \nPassword ?",
              style:
                  AppTypography.kExtraBold24.copyWith(color: AppColors.kBlack),
            ),
            SizedBox(height: 43.h),
            Form(
              key: _formKey,
              child: AuthField(
                  controller: emailController,
                  hintText: 'Username or Email',
                  icon: Icons.mail),
            ),
            SizedBox(height: 34.h),
            Text(
              "We will send you a message to set or reset your new password",
              style: AppTypography.kLight12.copyWith(color: AppColors.kBlack),
            ),
            SizedBox(height: 33.h),
            CommomButton(
              color: AppColors.kPrimary,
              color2: AppColors.kWhite,
              border: Border.all(color: AppColors.kPrimary, width: 1),
              onTap: _sendPasswordResetEmail,
              text: 'Submit',
            )
          ],
        ),
      ),
    );
  }
}
