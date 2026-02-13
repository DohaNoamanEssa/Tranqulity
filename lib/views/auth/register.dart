import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_appbar.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_image_dialog.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/core/ui/app_login_or_register.dart';
import 'package:tranqulity/views/auth/otp.dart';
import '../../core/logic/input_validator.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0.r),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      AppImage(
                        // image: profileImage!=null ? profileImage : "pick_image.svg",
                        image: "pick_image.svg",
                        width: 162.w,
                        height: 153.h,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          child: AppImage(
                            image: "add.svg",
                            width: 51.w,
                            height: 51.h,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AppImageDialog(
                                onImageSelected: (file) {
                                  setState(() {
                                    profileImage = file;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 41.h),
                  AppInput(hintText: "Username"),
                  AppInput(
                    hintText: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  AppInput(hintText: "Age", keyboardType: TextInputType.phone),

                  GestureDetector(
                    onTap: (){

                    },
                    child: AppInput(
                      hintText: "Gender",
                      suffixIcon: "arrow_down.svg",
                      isrReadOnly: true,
                    ),
                  ),
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
                  ),
                  AppButton(
                    buttonTitle: "Sign Up",
                    onPressed: () {
                      goTo(OTPView());
                    },
                  ),
                  SizedBox(height: 36.h),
                  AppLoginOrRegister(isLogin: false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  final TextEditingController genderController = TextEditingController();

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        hintText: "Gender",
        suffixIcon: Icon(Icons.arrow_drop_down),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedGender,
          isExpanded: true,
          hint: Text("Select Gender"),
          items: ["Male", "Female"].map((gender) {
            return DropdownMenuItem<String>(value: gender, child: Text(gender));
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedGender = value;
              genderController.text = value ?? "";
            });
          },
        ),
      ),
    );
  }
}
