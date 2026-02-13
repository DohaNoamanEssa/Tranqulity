import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:flutter/services.dart';

import '../../../core/ui/app_appbar.dart';
import '../../../core/ui/app_drawer.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  String copiedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AppImage(
              image:
                  "https://miro.medium.com/v2/resize:fit:1200/1*XO2uboxfxRisSccTeG5iuA.jpeg",
            ),
          ),
          SafeArea(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 16.w),
                margin: EdgeInsets.all(13.r),
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF).withValues(alpha: .81),
                  borderRadius: BorderRadius.circular(16.r),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                      color: Color(0xff000000).withValues(alpha: .25),
                    ),
                  ],
                ),
                // width: 403.w,
                // height: 500.h,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.r),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppImage(
                        image: "quote.svg",
                        width: 30.w,
                        height: 20.h,
                        bottomSpace: 16.h,
                      ),
                      Text(
                        "“ The only way to do\ngreat work is to love\nwhat you do “",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 34.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Text(
                          "Steve Jobs",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Copy",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: 7.w),
                          IconButton(
                            icon: AppImage(image: "copy.svg"),
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: copiedText),
                              );
                              print("000000000 doha $copiedText");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
