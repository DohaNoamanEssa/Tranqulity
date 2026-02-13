import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';

class AppInput extends StatefulWidget {
  final TextInputType? keyboardType;
  final bool isPassword;
  final VoidCallback? onPressed;
  final String? suffixIcon;
  final double? bottomSpace;
  final TextEditingController? controller;
  final ValueChanged<String>? onCountryCodeChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final int maximumLines;
  final bool isrReadOnly;



  const AppInput({
    super.key,
    this.suffixIcon,
    this.onPressed,
    this.keyboardType,
    this.isPassword = false,
    this.bottomSpace = 16,
    this.controller,
    this.onCountryCodeChanged,
    this.validator,
    this.hintText,
    this.maximumLines=1,
    this.isrReadOnly=false,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: TextFormField(
              readOnly: widget.isrReadOnly,
              maxLines: widget.maximumLines,
              controller: widget.controller,
              validator: widget.validator,
              maxLength: 10,
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword && isHidden,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff284243).withValues(alpha: .03),

                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff284243).withValues(alpha: .29),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff284243).withValues(alpha: .29),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),

                suffixIcon: widget.isPassword
                    ? Padding(
                        padding: EdgeInsets.all(12.r),
                        child: AppImage(
                          image: 'password_visibility.json',
                          bottomSpace: 0,
                          width: 20.w,
                          height: 20.h,
                          fit: BoxFit.scaleDown,
                          onLottieClicked: () {
                            isHidden = !isHidden;
                            setState(() {});
                          },
                        ),
                      )
                    : widget.suffixIcon != null
                    ? AppImage(image: widget.suffixIcon!, width: 18, height: 18)
                    : null,

                suffixIconColor: Color(0xff8E8EA9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
