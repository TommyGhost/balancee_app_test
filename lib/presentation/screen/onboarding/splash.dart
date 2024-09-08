import 'package:balancee_app/presentation/base/base_ui.dart';
import 'package:balancee_app/routes/routes.dart';
import 'package:balancee_app/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    next();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Pallet.primary, // Navigation bar color
      systemNavigationBarIconBrightness: Brightness.light, // Navigation bar icon color
    ));
  }

  void next() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3));

      navigationService.navigateToReplace(AppRoutes.rewards);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Pallet.primary,
        body: Center(
          child: Image.asset(
            AppImages.appSplashLogo,
            width: 156.w,
            height: 44.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
