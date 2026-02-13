import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/logic/input_validator.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/core/ui/app_login_or_register.dart';
import 'package:tranqulity/core/ui/app_logo_text.dart';
import 'package:tranqulity/views/auth/forget_password.dart';
import 'package:tranqulity/views/home/view.dart';
import '../../core/ui/app_image.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.0.r).copyWith(top: 52.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppImage(image: "login.png", bottomSpace: 24.h),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Welcome To"),
                ),
                SizedBox(height: 6.h),
                AppLogoText(alignment: AlignmentDirectional.topStart),
                SizedBox(height: 10.h),
                AppInput(
                  controller: emailController,
                  validator: InputValidator.emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "amramer522@gmail.com",
                ),
                AppInput(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  isPassword: true,
                  validator: InputValidator.passwordValidator,
                  bottomSpace: 24.h,
                  hintText: "",
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: TextButton(
                    onPressed: () {
                      goTo(ForgetPasswordView(),canPop: true);
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 56.h),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(
                          context,
                        ).primaryColor.withValues(alpha: .1),
                      ),
                      width: 56.w,
                      height: 60.h,
                      child: AppImage(
                        image: "finger_print.svg",
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(child: AppButton(buttonTitle: "Log In",onPressed: (){
                      goTo(HomeView(),canPop: false);
                    },)),
                  ],
                ),
                SizedBox(height: 40.h),
                AppLoginOrRegister(isLogin: true),
                SizedBox(height: 24.h),
                LoginRow(
                  image: 'google.svg',
                  title: 'Login With Google',
                  withGoogle: true,
                ),
                SizedBox(height: 16.h),
                LoginRow(image: 'facebook.svg', title: 'Login With Facebook'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginRow extends StatelessWidget {
  final String image, title;
  final bool withGoogle;

  const LoginRow({
    super.key,
    required this.image,
    required this.title,
    this.withGoogle = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(
                  color: Color(0xff284243).withValues(alpha: .3),
                  width: 3,
                ),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              ),
            ),

            padding: EdgeInsets.all(8),
            width: 56.w,
            height: 51.h,
            child: AppImage(image: image, width: 24.w, height: 24.h),
          ),
          Container(
            decoration: BoxDecoration(
              color: withGoogle
                  ? Color(0xff35B542).withValues(alpha: .5)
                  : Color(0xff518EF8).withValues(alpha: .5),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
            ),

            padding: EdgeInsets.all(8),
            width: 326.w,
            height: 51.h,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
