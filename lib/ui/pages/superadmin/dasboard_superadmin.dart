import 'package:flutter/material.dart';
import 'package:sibaba/ui/pages/superadmin/data_unit_page.dart';
import 'package:sibaba/ui/pages/superadmin/home_superadmin_page.dart';
import 'package:sibaba/ui/pages/superadmin/pengguna_page.dart';
import 'package:sibaba/ui/pages/superadmin/settings/settings_page.dart';

class DashboardSuperadmin extends StatefulWidget {
  @override
  _DashboardSuperadminState createState() => _DashboardSuperadminState();
}

class _DashboardSuperadminState extends State<DashboardSuperadmin> {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomeSuperadminPage(),
    DataUnitPage(),
    PenggunaPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Data Unit'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Pengguna'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Pengaturan'),
        ],
      ),
    );
  }
}
