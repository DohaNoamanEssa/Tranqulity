import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/ui/app_drawer.dart';
import '../../../core/ui/app_image.dart';

class EmptyChatsView extends StatelessWidget {
  const EmptyChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppImage(
                  image: "chats.png",
                  width: 200.w,
                  height: 200.h,
                  bottomSpace: 10.h,
                ),
                Text(
                  "You don’t have any Chats yet.",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
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
