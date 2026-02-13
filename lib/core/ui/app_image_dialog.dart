import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_image.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AppImageDialog extends StatefulWidget {
  final Function(File) onImageSelected;

  const AppImageDialog({super.key, required this.onImageSelected});

  @override
  State<AppImageDialog> createState() => _DialogePageState();
}

class _DialogePageState extends State<AppImageDialog> {
  final ImagePicker _image = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _image.pickImage(source: source, imageQuality: 80);
    if (pickedFile != null) {
      widget.onImageSelected(File(pickedFile.path));
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      backgroundColor: Color(0xffFFFFFF),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            bottomRight: Radius.zero,
            bottomLeft: Radius.zero,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 206.8,
              spreadRadius: 0,
              offset: Offset(1, -13),
              color: Color(0xff000000).withValues(alpha: .05),
            ),
          ],
        ),
        padding: EdgeInsets.all(24.r),

        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Pick Image From...",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 29.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.camera),

                    child: Column(
                      children: [
                        AppImage(image: "camera.svg", bottomSpace: 8.h,),
                        Text(
                          "Camera",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.gallery),
                    child: Column(
                      children: [
                        AppImage(image: "gallery.svg", bottomSpace: 8.h),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
