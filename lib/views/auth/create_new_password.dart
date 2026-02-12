import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/views/auth/login.dart';
import '../../core/logic/input_validator.dart';
import '../../core/ui/app_appbar.dart';
import '../../core/ui/app_input.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({super.key});
  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
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
                  "Create New Password",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "create your new password to log in !",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 28.h),
                AppInput(
                  hintText: "Password",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validator: InputValidator.passwordValidator,
                ),
                AppInput(
                  hintText: "Confirm password ",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  validator: InputValidator.passwordValidator,
                  bottomSpace: 62.h,
                ),
                AppButton(onPressed: () {
                  goTo(LoginView());
                }, buttonTitle: "Verify"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
