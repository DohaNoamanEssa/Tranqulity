import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppOTP extends StatelessWidget {
  const AppOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      cursorColor: Theme.of(context).primaryColor,
      cursorHeight: 16.h,
      cursorWidth: 5.w,
      hintCharacter: "_",
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (builder, context) => SizedBox(width: 16.w),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.0.r),
        inactiveColor: Color(0xff284243).withValues(alpha: .29),
          activeColor: Color(0xff284243).withValues(alpha: .29),
        selectedColor: Color(0XFF284243),
        fieldHeight: 60.h,
        fieldWidth: 83.5.w,
        borderWidth: 1,
        errorBorderColor: Colors.red,

      ),
    );
  }
}
