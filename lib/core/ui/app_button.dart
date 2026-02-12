import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback? onPressed;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Color(0XFF284243),
        minimumSize: Size(382.w, 60.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: TextStyle(
          color: Color(0XFFFFFFFF),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
