import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranqulity/core/logic/helper_methods.dart';
import 'package:tranqulity/core/ui/app_drawer.dart';
import 'package:tranqulity/views/assistent.dart';
import 'package:tranqulity/views/home/pages/chats.dart';
import 'package:tranqulity/views/home/pages/profile.dart';
import 'package:tranqulity/views/home/pages/quotes.dart';
import '../../core/ui/app_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list = [
    _Model(icon: "chats.svg", title: "Chats", page: ChatsPage()),
    _Model(icon: "quotes.svg", title: "Quotes", page: QuotesPage()),
    _Model(icon: "profile.svg", title: "Profile", page: ProfilePage()),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list[currentIndex].title),
      ),

      body: list[currentIndex].page,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          goTo(AssistentView());
        },
        child: AppImage(image: "chatbot.svg", color: Color(0xffffffff)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: List.generate(
          list.length,
          (index) => BottomNavigationBarItem(
            icon: AppImage(
              image: list[index].icon,
              width: 24.w,
              height: 24.h,
              color: Color(0xffffffff).withValues(alpha: .3),
            ),
            activeIcon: AppImage(
              image: list[index].icon,
              width: 32.w,
              height: 32.h,
              color: Color(0xffffffff),
            ),
            label: list[index].title,


          ),
        ),
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },

        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),

        selectedItemColor: Color(0xffffffff),
        unselectedItemColor: Color(0xffffffff).withValues(alpha: .3),

        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w900,
        ),

      ),
      drawer: AppDrawerView(),
          );
  }
}

class _Model {
  final String icon;
  final String title;
  final Widget page;

  _Model({required this.icon, required this.title, required this.page});
}
