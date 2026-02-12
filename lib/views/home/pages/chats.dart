import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/ui/app_drawer.dart';

import '../../../core/ui/app_image.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: AppImage(image: "slider.svg"),
        title: Text("Chats"),
        centerTitle: false,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              ChatContent(title: "About Work", date: "10/12/2021"),
              ChatContent(title: "About My Family", date: "10/12/2021"),
              ChatContent(title: "My self", date: "10/12/2021"),
            ],
          ),
        ),
      ),
      drawer: AppDrawerView(),




    );
  }
}

class ChatContent extends StatefulWidget {
  const ChatContent({super.key, required this.title, required this.date});

  final String title, date;

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0).copyWith(bottom: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 52.h,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Color(0xff284243).withValues(alpha: .1),
                border: Border.all(color: Color(0xff000000)),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    widget.date,
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          AppImage(image: "delete.svg"),
        ],
      ),
    );
  }
}
