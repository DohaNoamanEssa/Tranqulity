import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/ui/app_menu_dialog.dart';
import 'package:tranqulity/core/ui/app_image.dart';
import 'package:tranqulity/core/ui/app_input.dart';

import '../core/ui/app_appbar.dart';

class AboutWorkView extends StatefulWidget {
  const AboutWorkView({super.key});

  @override
  State<AboutWorkView> createState() => _AboutWorkViewState();
}

class _AboutWorkViewState extends State<AboutWorkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "About Work",
        isCenter: true,


        list: [
          PopupMenuButton<ListTile>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    leading: AppImage(
                      image: "edit_menu.svg",

                    ),
                    title: Text(
                      "Edit Title",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => AppMenuDialog(),
                    );
                  },
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: AppImage(
                      image: "delete.svg",

                    ),
                    title: Text(
                      "Delete Chat",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFF0000),
                      ),
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              SizedBox(height: 50),
              Message(msg: "Hello How are you?", isMyMsg: true),
              SizedBox(height: 16.h),
              Message(
                msg:
                    "Hello! I'm just a computer program, so I don't have feelings in the same way humans do, but I'm here and ready to assist you. How can I help you today?",
              ),
              SizedBox(height: 16.h),
              Message(msg: "I feel upset", isMyMsg: true),
              SizedBox(height: 16.h),
              Message(
                msg:
                    "I'm sorry to hear that you're feeling upset. If you'd like, you can share what's on your mind, and I'm here to listen and offer support or guidance if you need it. Remember, it's okay to feel upset sometimes, and it's important to take care of yourself.",
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(child: AppInput(hintText: "write your message")),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xff284243),
              child: AppImage(image: "send_message.svg"),
            ),
          ],
        ),
      ),
    );
  }
}

class Message extends StatefulWidget {
  final String msg;
  final bool isMyMsg;

  const Message({super.key, required this.msg, this.isMyMsg = false});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return widget.isMyMsg
        ? Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Color(0xff284243),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                widget.msg,
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              ),
            ),
          )
        : Row(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: AppImage(
                  image: "robot.jpg",
                  isCircle: true,
                  width: 36.w,
                  height: 36.h,
                ),
              ),
              SizedBox(width: 7.w),
              Expanded(
                child: Container(
                  width: 333,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff284243).withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    widget.msg,
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                    maxLines: 7,
                  ),
                ),
              ),
            ],
          );
  }
}
