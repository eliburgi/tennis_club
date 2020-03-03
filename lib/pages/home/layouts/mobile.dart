import 'package:flutter/material.dart';

import '../widgets/shifting_tabbar.dart';
import '../widgets/icons.dart';

class HomePageLayoutMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ShiftingTabBar(
          forceUpperCase: true,
          tabs: [
            ShiftingTab(
              text: 'Home',
              icon: HomeIcon(),
            ),
            ShiftingTab(
              text: 'Courts',
              icon: CourtIcon(),
            ),
            ShiftingTab(
              text: 'Profile',
              icon: ProfileIcon(),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Home')),
            Center(child: Text('Courts')),
            Center(child: Text('Profile')),
          ],
        ),
      ),
    );
  }
}
