import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'navigation_drawer_menu.dart';
import 'theme/color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    //var currentUser;
    return Scaffold(
      backgroundColor: backgroundGrey,
      key: _drawerKey,
      appBar: getAppBar(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Veritabani")
              .doc("Kullanicilar")
              .collection("Kisisel Bilgiler")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return SingleChildScrollView(
                  child: Center(
                    child: Container(
                      width: 380,
                      height: 80,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                      ),
                      child:
                      Row(children: [
                        Text(
                          document["KullaniciAd"],
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 6),
                        Text(
                          document["KullaniciSoyad"],
                          style: TextStyle(fontSize: 20),
                        ),
                      ]),
                    ),
                    
                  ),
                );
              }).toList(),
            );
          }),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: darkblue),
        child: NavigationDrawerWidget(),
      ),
    );
  }

  PreferredSize getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: SafeArea(
        child: Container(
          color: darkblue,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      _drawerKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
