import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/logic/helper_methods.dart';
import '../core/ui/app_logo_text.dart';
import 'on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    super.initState();
    goTo(OnBoardingView(), delayInSeconds: 2,canPop: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipOval(
          child: Container(
            color: Theme.of(context).primaryColor.withValues(alpha: .3),
            alignment: AlignmentDirectional.center,
            width: 360.w,
            height: 360.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogoText(alignment: AlignmentDirectional.center,),
                Text(
                  "Together Towards Tranquility",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    color: Theme.of(
                      context,
                    ).primaryColor.withValues(alpha: .57),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
