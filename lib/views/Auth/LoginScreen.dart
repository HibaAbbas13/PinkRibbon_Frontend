import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pink_ribbon/providers/User_providers.dart' as custom;
import 'package:pink_ribbon/views/Auth/Components/Authfield.dart';
import 'package:pink_ribbon/views/Auth/ForgotPassword/Forgotpass.dart';
import 'package:pink_ribbon/views/Auth/SignUpScreen.dart';
import 'package:pink_ribbon/views/Components/CommonButton.dart';
import 'package:pink_ribbon/views/landingpage/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/app_assets.dart';
import '../../data/app_colors.dart';
import '../../data/typography.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/signin';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late SharedPreferences prefs;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      await Provider.of<custom.AuthProvider>(context, listen: false).signIn(
        _emailController.text,
        _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login successful!'),
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

  Future<void> signInWithGoogle() async {
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
          padding: const EdgeInsets.all(29.0),
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
                height: 50.h,
              ),
              Text("Welcome\nBack!",
                  style: AppTypography.kExtraBold24
                      .copyWith(color: AppColors.kBlack)),
              SizedBox(height: 57.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthField(
                        controller: _emailController,
                        hintText: 'Username or Email',
                        icon: Icons.mail),
                    SizedBox(height: 31.h),
                    AuthField(
                        controller: _passwordController,
                        isPassword: true,
                        hintText: 'Password',
                        icon: Icons.lock),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text("Forget Password?",
                      style: AppTypography.kExtraLight12
                          .copyWith(color: Colors.redAccent)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ForgotPass()),
                    );
                  },
                ),
              ),
              SizedBox(height: 52.h),
              CommomButton(
                  text: "Login ",
                  color: AppColors.kPrimary,
                  color2: AppColors.kWhite,
                  border: Border.all(color: AppColors.kPrimary, width: 1),
                  onTap: _submit),
              SizedBox(height: 75.h),
              Center(
                child: Text("-or Continue With-",
                    style: AppTypography.kExtraLight12
                        .copyWith(color: AppColors.kBlack)),
              ),
              SizedBox(height: 20.h),
              Center(
                child: InkWell(
                  onTap: signInWithGoogle,
                  child: Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.google)),
                        shape: BoxShape.circle),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create and Account",
                      style: AppTypography.kLight14
                          .copyWith(color: AppColors.kBlack)),
                  SizedBox(width: 5.w),
                  InkWell(
                    onTap: () {
                      // so jaaaaaaaaaaaaaaaaaa
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignUpScreen()));
                    },
                    child: Text("Sign Up",
                        style: AppTypography.kSemiBold14.copyWith(
                          color: AppColors.kPrimary,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.kPrimary,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
