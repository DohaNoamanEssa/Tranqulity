import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/views/about_work.dart';
import 'package:tranqulity/views/home/pages/profile.dart';
import 'package:tranqulity/views/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430.0, 932.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp(
          navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            primaryColor: Color(0XFF284243),
            fontFamily: "Inter",

            textTheme: TextTheme(
              displaySmall: TextStyle(color: Color(0XFF000000)),
              displayLarge: TextStyle(color: Color(0XFF000000)),
              displayMedium:  TextStyle(color: Color(0XFF000000)),
            ),
            appBarTheme: AppBarTheme(
              centerTitle: false,
              titleTextStyle: TextStyle(
                color: Color(0xff101010),
                fontWeight: FontWeight.w700,
                fontSize: 24,

              ),
            )
          ),
          home:  SplashView(),
        );
      },
    );
  }
}
