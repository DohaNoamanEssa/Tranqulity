import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppLogoText extends StatelessWidget {
  const AppLogoText({super.key, this.alignment});
  final dynamic alignment;

  @override
  Widget build(BuildContext context) {
    return   Align(
      alignment: alignment,
      child: Text(
         "Tranquility",
        style: TextStyle(
          fontFamily: "Mystery Quest",
          fontWeight: FontWeight.w400,
          fontSize: 48.sp,
          color: Theme.of(context).primaryColor,

        ),


      ),
    );
  }
}
