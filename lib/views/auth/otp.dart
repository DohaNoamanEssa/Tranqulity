import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_otp.dart';
import 'package:tranqulity/core/ui/app_resend_otp.dart';
import 'package:tranqulity/views/auth/create_new_password.dart';

import '../../core/ui/app_appbar.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppImage(image: "otp.png", bottomSpace: 24.h,),
                Text(
                  "Verification",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Please enter the code sent on your\nemail.",
                  style: TextStyle(
                    color: Color(0xff284243).withValues(alpha: .64),
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 36.h),
                AppOTP(),
                AppResendOTP(),
                SizedBox(height: 29.h,),
                AppButton(onPressed: (){
                  goTo(CreateNewPasswordView());
                }, buttonTitle: "Verify"),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
