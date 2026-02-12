import 'package:flutter/material.dart';
import 'app_image.dart';

class AppAppBar extends StatelessWidget
    implements PreferredSizeWidget {

  final String title;
  final bool isCenter;
  final List<Widget>? list;
  final Color? bgColor;
  const AppAppBar({super.key,  this.title="",this.isCenter=false,this.list,this.bgColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle:isCenter ,
      elevation: 0,
      backgroundColor:bgColor ?? Colors.transparent,
      leading: IconButton(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        icon: AppImage(
          image: "arrow_back.svg",
          width: 24,
          height: 24,
        ),

      ),
      actions: list,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
