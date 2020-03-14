import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_club/feature/auth/auth_notifier.dart';
import 'package:tennis_club/feature/home/shifting_tabbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ShiftingTabBar(tabs: [
          ShiftingTab(text: 'Home', icon: Icon(Icons.home)),
          ShiftingTab(text: 'Reservations', icon: Icon(Icons.calendar_today)),
          ShiftingTab(text: 'Profile', icon: Icon(Icons.person)),
        ]),
        body: TabBarView(
          children: <Widget>[
            _NotImplementedPage(),
            _NotImplementedPage(),
            _ProfilePage(),
          ],
        ),
      ),
    );
  }
}

class _NotImplementedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Not yet implemented.'),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () async {
          try {
            await Provider.of<AuthNotifier>(context, listen: false).logout();
          } catch (failure) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Logout failed!')),
            );
          }
        },
        child: Text('Sign Out'),
      ),
    );
  }
}
