import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/views/about_us.dart';
import 'package:tranqulity/views/auth/login.dart';
import 'package:tranqulity/views/suggestions.dart';

class AppDrawerView extends StatefulWidget {
  const AppDrawerView({super.key});

  @override
  State<AppDrawerView> createState() => _AppDrawerViewState();
}

class _AppDrawerViewState extends State<AppDrawerView> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 37,
                    right: 92,
                    left: 92,
                  ).copyWith(bottom: 16.h),
                  child: CircleAvatar(
                    radius: 80,
                    child: AppImage(
                      image:
                          "https://flex-home.botble.com/storage/accounts/8.jpg",
                      isCircle: true,
                    ),
                  ),
                ),
                Text(
                  "Sara",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "01027545631",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 28.h),
              ],
            ),
          ),

          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                ChatContent(
                  title: "About Us",
                  icon: "about_us.svg",
                  onPressed: () => goTo(AboutUsView()),
                ),
                ChatContent(title: "Rate Our App", icon: "rate.svg"),
                ChatContent(
                  title: "Suggestions",
                  icon: "suggestion.svg",
                  onPressed: () => goTo(SuggestionsView()),
                ),
                ChatContent(
                  title: "Enable Easy Login",
                  icon: "finger_print.svg",
                  isEasyLogin: true,
                ),

                ChatContent(
                  title: "Logout",
                  icon: "logout.svg",
                  isLogout: true,
                  onPressed: () => goTo(LoginView()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatContent extends StatefulWidget {
  final String icon, title;
  final bool isLogout, isEasyLogin;
  final VoidCallback? onPressed;

  const ChatContent({
    super.key,
    required this.icon,
    required this.title,
    this.isLogout = false,
    this.isEasyLogin = false,
    this.onPressed,
  });

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0).copyWith(bottom: 16.h),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 56.h,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: widget.isLogout
                      ? Color(0xffFF3A3A).withValues(alpha: .1)
                      : Color(0xff284243).withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    AppImage(image: widget.icon, width: 24.w, height: 24.h),
                    SizedBox(width: 3.w),
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: widget.isLogout
                            ? Color(0xffF60000)
                            : Color(0xff000000),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    if (widget.isEasyLogin) ...[
                      Spacer(),
                      Switch(
                        value: isOn,

                        onChanged: (value) {
                          setState(() {
                            isOn = value;
                          });
                        },
                        hoverColor: Colors.red,
                        focusColor: Colors.green,
                        // inactiveTrackColor: Colors.yellow,
                        activeTrackColor: Colors.blue,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
