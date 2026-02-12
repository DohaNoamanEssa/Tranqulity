import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_appbar.dart';
import 'package:tranqulity/core/ui/app_button.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_input.dart';
import 'package:tranqulity/views/home/pages/chats.dart';

class SuggestionsView extends StatelessWidget {
  const SuggestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppAppBar(title: "Suggestions"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              AppImage(
                image: "suggestions.png",
                bottomSpace: 53.h,
                width: 289.w,
                height: 215.h,
              ),
              AppInput(hintText: "Subject"),
              AppInput(hintText: "body", bottomSpace: 24.h, maximumLines: 5),
              AppButton(
                onPressed: () {
                  goTo(ChatsPage());
                },
                buttonTitle: "Send Message",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
