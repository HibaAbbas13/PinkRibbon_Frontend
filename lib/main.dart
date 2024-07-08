import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pink_ribbon/FcmService.dart';

import 'package:pink_ribbon/data/app_assets.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/firebase_options.dart';
import 'package:pink_ribbon/providers/Transaction_provider.dart';

import 'package:pink_ribbon/providers/User_providers.dart';
import 'package:pink_ribbon/providers/Vedio_Provider.dart';
import 'package:pink_ribbon/views/Auth/LoginScreen.dart';

import 'package:pink_ribbon/views/RegistrationView/RegistrationScreen.dart';
import 'package:pink_ribbon/views/Vedio_Page/Vediopage.dart';
import 'package:pink_ribbon/views/landingpage/landing_page.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.subscribeToTopic('sample');
  await FCMService().init();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('FCM-TOKEN: $fcmToken');
  runApp(MyApp(
    token: prefs.getString('token'),
  ));
}

class MyApp extends StatefulWidget {
  final token;
  const MyApp({
    @required this.token,
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final imageList = [
      AppAssets.kLogo,
      AppAssets.kDonate,
      AppAssets.kBackground,
      AppAssets.kHospital1,
      AppAssets.kHospital2,
      AppAssets.kHospital3,
      AppAssets.kSurvivor1,
      AppAssets.kSurvivor2,
      AppAssets.kSurvivor3,
      // AppAssets.splash,
      // AppAssets.onboarding1,
      // AppAssets.onboarding2,
      // AppAssets.onboarding3,
      // AppAssets.onboarding4,
      // AppAssets.registraion,
      // AppAssets.ellipse,
      // AppAssets.google,
      // AppAssets.fb,
    ];
    for (final path in imageList) {
      precacheImage(AssetImage(path), context);
    }
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => TransactionProvider()),
          ChangeNotifierProvider(
            create: (context) => VideoProvider(),
          )
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: MaterialApp(
                  title: 'Stylish',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      primaryColor: AppColors.kPrimary,
                      scaffoldBackgroundColor: AppColors.kWhite,
                      appBarTheme:
                          AppBarTheme(backgroundColor: AppColors.kWhite)),
                  scrollBehavior:
                      const ScrollBehavior().copyWith(overscroll: false),
                  home: (widget.token != null &&
                          JwtDecoder.isExpired(widget.token) == false)
                      ? LoginScreen()
                      :  LandingPage(),
                ));
          },
        ));
  }
}
