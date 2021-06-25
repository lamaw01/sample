import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Botox Yamate'),
            accountEmail: Text('botox@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: FlutterLogo(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text('Settings'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
