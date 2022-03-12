import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:database/theme/color.dart';

import 'DataController.dart';
class AramaPage extends StatefulWidget {
  const AramaPage({ Key? key }) : super(key: key);

  @override
  _AramaPageState createState() => _AramaPageState();
}

class _AramaPageState extends State<AramaPage> {
  final TextEditingController searchController= TextEditingController();
  late QuerySnapshot snapshotData;
  bool isExecuted= false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData(){
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
            ),
            title: Text(snapshotData.docs[index]['KullaniciAd']),
            subtitle: Text(snapshotData.docs[index]['KullaniciSoyad']),
          );}
      );
    }

    return Scaffold(
      floatingActionButton: 
      FloatingActionButton(child: Icon(Icons.clear),onPressed: (){
        setState(() {
          isExecuted=false;
        });
      },),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: darkblue,
        actions: [
          GetBuilder<DataController>(
            init:DataController(),
            builder:(val){
              return IconButton(icon: Icon(Icons.search), onPressed: (){
                val.queryData(searchController.text).then((value){
                  snapshotData= value;
                  setState(() {
                    isExecuted= true;
                  });
                });
              },);
            }
          )
          ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search users',
          ),
          controller: searchController,
        ),
      ),
      body: isExecuted ? searchedData() : Container(
          child: Center(
            child: Text("ARAMA SAYFASI"),
          ),
        )
    );
  }
}