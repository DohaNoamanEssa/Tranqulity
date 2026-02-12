import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/ui/app_appbar.dart';

import '../core/ui/app_image.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "About Us",),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            AppImage(
              image: "logo.png",
              bottomSpace: 14.h,
              width: 238.w,
              height: 238.h,
            ),
            Text(
              "Welcome to Tranquility\nwhere relaxation meets innovation.",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              "Welcome to Tranquility – your personal assistant in the digital world. At Tranquility, we believe that everyone deserves a moment of peace and calm amidst the chaos of everyday life. Our mission is to provide a sanctuary where you can unwind, destress, and find solace through meaningful conversations with our AI chatbot.\n",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "In today's fast-paced world, it's easy to feel overwhelmed and anxious. That's why we've created Tranquility – to offer you a refuge where you can freely express yourself without fear of judgment or interruption. Whether you're seeking advice, a listening ear, or simply some company, our AI chatbot is here to support you every step of the way.\n",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

            Text(
              "Our team is passionate about mental well-being and technology, and we're dedicated to harnessing the power of AI to promote relaxation and mindfulness. With Tranquility, you can embark on a journey of self-discovery, self-care, and self-improvement, all from the comfort of your smartphone.\n",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "So why wait? Take a deep breath, download Tranquility, and let our AI chatbot guide you on your path to inner peace and tranquility. Together, we can create a brighter, calmer future – one conversation at a time.\n",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
