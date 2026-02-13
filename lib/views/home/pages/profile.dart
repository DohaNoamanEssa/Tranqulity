import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/views/auth/change_password.dart';
import 'package:tranqulity/views/auth/login.dart';

import '../../../core/ui/app_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var color = Color(0XFF284243);
  var icon = "edit.svg";

  @override
  Widget build(BuildContext context) {
    TextEditingController? emailController;
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    AppImage(
                      image:
                          "https://flex-home.botble.com/storage/accounts/8.jpg",
                      width: 160.w,
                      height: 160.h,
                      isCircle: true,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          color = Color(0xFFF44336);
                          icon = "delete.svg";
                          setState(() {});
                        },
                        child: CircleAvatar(
                          backgroundColor: color,
                          child: AppImage(
                            image: icon,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34.h),
              AppInput(hintText: "Sara"),
              AppInput(
                hintText: "amramer522@gmail.com",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppInput(
                      hintText: "22",
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: AppInput(
                      hintText: "Female",
                      suffixIcon: "arrow_down.svg",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33.h),
              AppButton(onPressed: () {
                goTo(LoginView());
              }, buttonTitle: "Save"),
              SizedBox(height: 21.h),
              Row(
                children: [
                  TextButton(
                    onPressed: () => goTo(ChangePasswordView()),
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(child: AppImage(image: "edit.svg",),onTap: () => goTo(ChangePasswordView()),),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
