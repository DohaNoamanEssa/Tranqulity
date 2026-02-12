import 'package:tranqulity/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppArrowRight extends StatelessWidget {
  const AppArrowRight({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: AlignmentDirectional.centerStart,
      child: CircleAvatar(
        radius: 25.r,
        backgroundColor: Theme.of(context).primaryColor,
        child: AppImage(image: "arrow_right.svg",color: Color(0XFFFFFFFF),width: 10.w,height: 20.h,),

      ),
    );
  }
}
