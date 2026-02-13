import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/views/home/view.dart';
import '../../core/logic/input_validator.dart';
import '../../core/ui/app_appbar.dart';
import '../../core/ui/app_input.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});
  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

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
                AppImage(image: "change_password.png", bottomSpace: 24.h),
                Text(
                  "Change Your Password",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(height: 24.h),
                AppInput(
                  hintText: "Old Password",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validator: InputValidator.passwordValidator,
                ),
                AppInput(
                  hintText: "New Password ",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  validator: InputValidator.passwordValidator,
                ),  AppInput(
                  hintText: "Confirm New Password ",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  validator: InputValidator.passwordValidator,
                ),
                SizedBox(height: 36.h,),
                AppButton(onPressed: () {
                  goTo(HomeView());

                }, buttonTitle: "Change Password"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
