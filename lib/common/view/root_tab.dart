import 'package:deli/common/const/colors.dart';
import 'package:deli/common/layout/default_layout.dart';
import 'package:deli/rest/view/rest_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);

    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '딜리버리',
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: BODY_TEXT_COLOR,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.animateTo(index);
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined),
              label: '음식',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: '주문',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: '프로필',
            ),
          ],
        ),
        child: TabBarView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const RestScreen(),
            Container(
              child: const Text('음식'),
            ),
            Container(
              child: const Text('주문'),
            ),
            Container(
              child: const Text('프로필'),
            ),
          ],
        ));
  }
}
