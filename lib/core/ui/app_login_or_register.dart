import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/views/auth/register.dart';

import '../logic/helper_methods.dart';

class AppLoginOrRegister extends StatefulWidget {
  final bool isLogin;

  const AppLoginOrRegister({super.key, this.isLogin = true});

  @override
  State<AppLoginOrRegister> createState() => _AppLoginOrRegisterState();
}

class _AppLoginOrRegisterState extends State<AppLoginOrRegister> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: widget.isLogin
                  ? "Don’t have an account? "
                  : "Already have an account ? ",
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                ),
                child: Text(
                  widget.isLogin ? "Sign up" : "Login",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                onPressed: () {
                  widget.isLogin ? goTo(RegisterView()) : Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
