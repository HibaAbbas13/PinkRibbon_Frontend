import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/config.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/views/Auth/Components/Authfield.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pink_ribbon/views/Auth/LoginScreen.dart';
import 'package:pink_ribbon/views/landingpage/landing_page.dart';
import 'package:provider/provider.dart';
import '../../data/app_assets.dart';
import '../../data/typography.dart';
import '../Components/CommonButton.dart';
import 'package:pink_ribbon/providers/User_providers.dart' as custom;

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  String? deviceToken;

  @override
  void initState() {
    super.initState();
    _getDeviceToken();
  }

  Future<void> _getDeviceToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    deviceToken = await messaging.getToken();
    print("Device Token: $deviceToken");
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      if (deviceToken == null) {
        throw 'Device token not available';
      }

      await Provider.of<custom.AuthProvider>(context, listen: false).signUp(
        _emailController.text,
        _passwordController.text,
        _passwordConfirmationController.text,
        deviceToken!, // Pass the device token to the sign-up method
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Registration successful!'),
      ));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        // Navigate to the LandingPage without replacing the current screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LandingPage()),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
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
              SizedBox(height: 50.h),
              Text(
                "Create an \nAccount",
                style: AppTypography.kExtraBold24
                    .copyWith(color: AppColors.kBlack),
              ),
              SizedBox(height: 33.h),
              Form(
                key: _formKey,
                child: Column(children: [
                  AuthField(
                    controller: _emailController,
                    isPassword: false,
                    hintText: 'Username or Email',
                    icon: Icons.mail,
                  ),
                  SizedBox(height: 31.h),
                  AuthField(
                    controller: _passwordController,
                    isPassword: true,
                    hintText: 'Password',
                    icon: Icons.lock,
                  ),
                  SizedBox(height: 31.h),
                  AuthField(
                    controller: _passwordConfirmationController,
                    isPassword: true,
                    hintText: 'Confirm Password',
                    icon: Icons.lock,
                  ),
                  SizedBox(height: 19.h),
                ]),
              ),
              SizedBox(height: 38.h),
              CommomButton(
                text: "Create Account",
                color: AppColors.kPrimary,
                color2: AppColors.kWhite,
                border: Border.all(color: AppColors.kPrimary, width: 1),
                onTap: _submit,
              ),
              SizedBox(height: 40.h),
              Center(
                child: Text(
                  "-or Continue With -",
                  style:
                      AppTypography.kLight12.copyWith(color: AppColors.kBlack),
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: signInWithGoogle,
                child: Center(
                  child: Container(
                    height: 56.h,
                    width: 56.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppAssets.google),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account",
                    style: AppTypography.kLight14
                        .copyWith(color: AppColors.kBlack),
                  ),
                  SizedBox(width: 5.w),
                  TextButton(
                    child: Text(
                      "Login",
                      style: AppTypography.kSemiBold14.copyWith(
                          color: AppColors.kPrimary,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.kPrimary),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
