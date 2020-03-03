import 'package:flutter/material.dart';

import '../widgets/shifting_tabbar.dart';
import '../widgets/icons.dart';

class HomePageLayoutMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ShiftingTabBar(
          tabs: [
            ShiftingTab(
              text: 'Item A',
              icon: HomeIcon(),
            ),
            ShiftingTab(
              text: 'Item B',
              icon: Icon(Icons.whatshot),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Item A')),
            Center(child: Text('Item B')),
          ],
        ),
      ),
    );
  }
}
