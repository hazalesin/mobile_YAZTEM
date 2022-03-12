import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VeritabaniIslemleri {
  FirebaseAuth auth= FirebaseAuth.instance;
  kullaniciEgitim(String t1, String t2, String t3) {
    var currentUser = FirebaseAuth.instance.currentUser!.email.toString();
    FirebaseFirestore.instance
        .collection("Veritabani")
        .doc("Kullanicilar")
        .collection("Egitim Bilgileri")
        .doc(currentUser)
        .set({'kullaniciemail': auth.currentUser!.email,
      'KullaniciOkul': t1,
      'KullaniciBolum': t2,
      'KullaniciSınıf': t3,
    }).whenComplete(() => print("Egitim bilgisi eklendi"));
  }

  kullaniciAdSoyadIletisim(String t1, String t2, String t3,String t4) {
    var currentUser = FirebaseAuth.instance.currentUser!.email.toString();
    FirebaseFirestore.instance
        .collection("Veritabani")
        .doc("Kullanicilar")
        .collection("Kisisel Bilgiler")
        .doc(currentUser)
        .set({
      'kullaniciemail': auth.currentUser!.email, 
      'KullaniciAd': t1,
      'KullaniciSoyad': t2,
      'KullaniciMail': t3,
      'KullaniciPass': t4,
      
    }).whenComplete(() => print("Kişi bilgisi eklendi"));
  }

  kullaniciRol(String t1, String t2, String t3) {
    var currentUser = FirebaseAuth.instance.currentUser!.email.toString();
    FirebaseFirestore.instance
        .collection("Veritabani")
        .doc("Kullanicilar")
        .collection("Rol Bilgileri")
        .doc(currentUser)
        .set({
      'KullaniciToplulukAdi': t1,
      'KullaniciEkipAdi': t2,
      'KullaniciRol': t3,
    }).whenComplete(() => print("Rol bilgisi eklendi"));
  }

  void kullaniciSertifika(String text, String text2, String text3) {
    var currentUser = FirebaseAuth.instance.currentUser!.email.toString();
    FirebaseFirestore.instance
        .collection("Veritabani")
        .doc("Kullanicilar")
        .collection("Sertifika Bilgileri")
        .doc(currentUser)
        .set({
      'SertifikaAdi': text,
      'SertifikaAlinanYer': text2,
      'SertifikaAlinanTarih': text3,
    }).whenComplete(() => print("Sertifika bilgisi eklendi"));
  } 
  
}
