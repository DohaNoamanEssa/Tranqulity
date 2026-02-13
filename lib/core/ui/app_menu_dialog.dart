import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'app_button.dart';
import 'app_image.dart';

class AppMenuDialog extends StatefulWidget {
  const AppMenuDialog({super.key});

  @override
  State<AppMenuDialog> createState() => _DialogePageState();
}

class _DialogePageState extends State<AppMenuDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffD9D9D9),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
        padding: EdgeInsets.all(32.0.r),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  "Edit Title",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Color(0xff000000),
                  ),
                ),
                trailing: IconButton(
                  icon: AppImage(image: "close.svg"),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 35.h),
              AppInput(),
              AppButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
