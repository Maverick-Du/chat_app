import 'package:chat_app/pages/card/card.dart';
import 'package:chat_app/pages/chat/chat.dart';
import 'package:chat_app/pages/contacts/contacts.dart';
import 'package:chat_app/pages/moments/moments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,  //点返回键无法返回到先前的页面（登录页）
      onPopInvokedWithResult: (didPop, result) => SystemNavigator.pop,  //点返回键直接退出应用
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.paperplane),
                activeIcon: Icon(CupertinoIcons.paperplane_fill),
                label: '动态',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.bubble_left_bubble_right,
                  ),
                  activeIcon: Icon(
                    CupertinoIcons.bubble_left_bubble_right_fill,
                  ),
                  label: '消息'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_3),
                  activeIcon: Icon(CupertinoIcons.person_3_fill),
                  label: '联系人'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  activeIcon: Icon(CupertinoIcons.person_fill),
                  label: '我'),
            ],
          ),
          tabBuilder: (context, index) {
            late final CupertinoTabView returnView;
            switch (index) {
              case 0:
                returnView = CupertinoTabView(
                  builder: (context) {
                    return const SafeArea(child: MyMomentsPage());
                  },
                );
                break;
              case 1:
                returnView = CupertinoTabView(
                  builder: (context) {
                    return const SafeArea( child: MyChatPage());
                  },
                );
                break;
              case 2:
                returnView = CupertinoTabView(
                  builder: (context) {
                    return const SafeArea(child: MyContactsPage(),);
                  },
                );
                break;
              case 3:
                returnView = CupertinoTabView(
                  builder: (context) {
                    return const SafeArea(child: MyCardPage(),);
                  },
                );
                break;
            }
            return returnView;
          }),
    );
  }
}
