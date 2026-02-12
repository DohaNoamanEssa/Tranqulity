import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/views/auth/otp.dart';

import '../../core/ui/app_appbar.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_input.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController emailController = TextEditingController();

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
                AppImage(image: "forget_password.png", bottomSpace: 24.h),
                Text(
                  "Forget Your Password",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                  ),

                ),
                SizedBox(height: 33.h,),
                AppInput(
                  hintText: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  bottomSpace: 33.h,
                ),
                AppButton(buttonTitle: "Forget Password",onPressed: (){
                  goTo(OTPView());
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
