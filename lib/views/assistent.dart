import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/views/about_work.dart';

import '../core/ui/app_appbar.dart';

class AssistentView extends StatelessWidget {
  const AssistentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(bgColor: Color(0xff284243).withValues(alpha: .15),),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff284243).withValues(alpha: .15),
                ),

                child: Column(
                  children: [
                    // Align(
                    //     alignment: AlignmentDirectional.topStart,
                    //     child: AppImage(image: "arrow_back.svg")),
                    AppImage(image: "assisant.png", bottomSpace: 14.h),
                    Text(
                      "Hey!",
                      style: TextStyle(
                        color: Color(0xff284243),
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "I’am your Personal Assistent\n",
                      style: TextStyle(
                        color: Color(0xff284243),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  children: [
                    SizedBox(height: 48.h),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        "Make New Chat",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    AppInput(hintText: "Enter The Title Of Chat"),
                    SizedBox(height: 14.h),

                    AppButton(
                      onPressed: () {
                        goTo(AboutWorkView());
                      },
                      buttonTitle: "Start Chat",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
