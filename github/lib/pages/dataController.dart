import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class DataController extends GetxController {
  Future getData(String collection)async{
    final FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;
    QuerySnapshot snapshot=
      await firebaseFirestore.collection(collection).get();
      return snapshot.docs;
  }

  Future queryData(String queryString)async{
    return FirebaseFirestore.instance
      .collection('Veritabani')
      .doc('Kullanicilar')
      .collection('Kisisel Bilgiler')
      .where("KullaniciAd", isGreaterThanOrEqualTo: queryString)
      .get();
  }

  
} 