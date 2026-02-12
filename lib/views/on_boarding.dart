import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/extension.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_arrow_right.dart';
import '../core/logic/helper_methods.dart';
import 'auth/login.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardindViewState();
}

class _OnBoardindViewState extends State<OnBoardingView> {
  final list = [
    _Model(
      imgURL: "on_boarding1.png",
      title: "Feel Free",
      subTitle:
          "because I'm the friendly chatbot\n here to assist you with anything you\n need",
    ),

    _Model(
      imgURL: "on_boarding2.png",
      title: "Ask For Anything",
      subTitle:
          "I'm your friendly neighborhood\n chatbot ready to assist you with\n any questions or concerns.",
    ),
    _Model(
      imgURL: "on_boarding3.png",
      title: "Your Secert is Save",
      subTitle: "Our platform prioritizes your privacy\n and security",
    ),
  ];
  int currentIndex = 0;
  int lastIndex = 2;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    bool isLast = currentIndex == list.length - 1;
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: list.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            final item = list[index];
            return SingleChildScrollView(
              child: Column(
                children: [
                  AppImage(
                    image: item.imgURL,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 600.h,
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          item.subTitle.toTitleCase(),
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20.r),
        width: double.infinity,
        height: 90.h,
        child: Row(
          children: [
            if (!isLast)
              InkWell(
                onTap: () => goTo(LoginView()),
                child: Text(
                  "skip".toTitleCase(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            Spacer(),
            GestureDetector(

              onTap: () {
                if (currentIndex < lastIndex) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                } else {
                  goTo(LoginView());
                }
              },

              child: AppArrowRight(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Model {
  final String imgURL;
  final String title;
  final String subTitle;

  _Model({required this.imgURL, required this.title, required this.subTitle});
}
