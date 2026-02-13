import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/dio_helper.dart';
import 'package:tranqulity/core/ui/app_appbar.dart';

import '../core/ui/app_image.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<AboutUsData> list;
  DataState state = DataState.loading;

  Future<void> getData() async {
    state = DataState.loading;
    setState(() {});
    final resp = await DioHelper.getData("api/AboutUs");

    if (resp!.isSuccess && resp.data != null) {
      list = [AboutUsData.fromJson(resp.data)];
      state = DataState.success;
    } else {
      state = DataState.failed;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "About Us"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            AppImage(
              image: state == DataState.success
                  ? (list[currentIndex].imageUrl != "")?list[currentIndex].imageUrl  : "logo.png"
                  : "https://static.vecteezy.com/system/resources/previews/021/756/508/non_2x/error-icon-3d-rendering-illustration-vector.jpg",
              bottomSpace: 14.h,
              width: 238.w,
              height: 238.h,
            ),
            Text(
              state == DataState.success ? list[currentIndex].title : "error",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              state == DataState.success ? list[currentIndex].body.replaceAll("</p>", "").replaceAll("<p>", "") : "error",
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

class AboutUsData {
  late final String title;
  late final String body;
  late final String imageUrl;

  AboutUsData.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    body = json['body'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
  }
}
