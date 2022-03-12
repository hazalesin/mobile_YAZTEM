import 'package:flutter/material.dart';
import 'package:database/login_page.dart';
import 'package:database/profile_page.dart';

import 'anasayfa.dart';
import 'arama_page.dart';
import 'theme/color.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: darkblue,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 150),
            buildMenuItem(
              text:'Anasayfa',
              icon: Icons.home,
              onClicked: () => selectedItem(context,0),
            ),
            const SizedBox(height: 30),
            buildMenuItem(
              text:'Arama',
              icon: Icons.search,
              onClicked: () => selectedItem(context,1),
            ),
            const SizedBox(height: 30),
            buildMenuItem(
              text:'Profilim',
              icon: Icons.logout,
              onClicked: () => selectedItem(context,3),
            ),
            const SizedBox(height: 30),
            buildMenuItem(
              text:'Çıkış yap',
              icon: Icons.logout,
              onClicked: () => selectedItem(context,4),
            ),
            
            
          ],
        ),
      ),
    );
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}){
  final color= Colors.white;

  return ListTile(
    leading: Icon(icon, color:color),
    title: Text(text, style: TextStyle(color:color)),
    onTap: onClicked,
  );
}

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index){
      case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
      break;
      case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AramaPage(),
      ));
      break;
      case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginPage(),
      ));
      break;
      case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfilPage(),
      ));
      break;
    }
  }
}
