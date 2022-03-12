import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:database/theme/color.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YAZTEM"),
        backgroundColor: darkblue,
      ),
      body: Column(
        children: [
          Container(
            child: KisiselBilgiler(),
          ),
          Container(
            child: EgitimBilgileri(),
          ),
          Container(
            child: RolBilgileri(),
          ),
          Container(
            child: SertifikaBilgileri(),
          )
        ],
      ),
    );
  }

  buildAddButton() {}
}

class KisiselBilgiler extends StatelessWidget {
  KisiselBilgiler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('Veritabani')
        .doc('Kullanicilar')
        .collection('Kisisel Bilgiler');

    return FutureBuilder<DocumentSnapshot>(
      future:
          users.doc(FirebaseAuth.instance.currentUser!.email.toString()).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print("veri geliş");
          return Container(
            width: 380,
            height: 120,
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
            ),
            child: Text(
              "Ad : ${data["KullaniciAd"]}\nSoyad : ${data["KullaniciSoyad"]}\nMail : ${data["kullaniciemail"]}\n",
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        print("---------------------------------");
        print(FirebaseAuth.instance.currentUser!.email.toString());
        print("------------------------------------");
        return Text("loading");
      },
    );
  }
}

class EgitimBilgileri extends StatelessWidget {
  const EgitimBilgileri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('Veritabani')
        .doc('Kullanicilar')
        .collection('Egitim Bilgileri');

    return FutureBuilder<DocumentSnapshot>(
      future:
          users.doc(FirebaseAuth.instance.currentUser!.email.toString()).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print("veri geliş");
          return Container(
              width: 380,
              height: 120,
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
              ),
              child: Text(
                "Okul : ${data["KullaniciOkul"]}\nBölüm : ${data["KullaniciBolum"]}\nSınıf : ${data["KullaniciSınıf"]}\n",
                style: TextStyle(fontSize: 18),
              ),
              );
          //Text("Full Name: ${data['KullaniciAd']} ${data['KullaniciSoyad']}");
        }
        print("---------------------------------");
        print(FirebaseAuth.instance.currentUser!.email.toString());
        print("------------------------------------");
        return Text("loading");
      },
    );
  }
}

class RolBilgileri extends StatelessWidget {
  const RolBilgileri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('Veritabani')
        .doc('Kullanicilar')
        .collection('Rol Bilgileri');

    return FutureBuilder<DocumentSnapshot>(
      future:
          users.doc(FirebaseAuth.instance.currentUser!.email.toString()).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print("veri geliş");
          return Container(
              width: 380,
              height: 120,
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
              ),
              child: Text(
                  "Topluluk Adı : ${data["KullaniciToplulukAdi"]}\nEkip Adı : ${data["KullaniciEkipAdi"]}\nEkipteki Rolü : ${data["KullaniciRol"]}\n",
                  style: TextStyle(fontSize: 18)));
          //Text("Full Name: ${data['KullaniciAd']} ${data['KullaniciSoyad']}");
        }
        print("---------------------------------");
        print(FirebaseAuth.instance.currentUser!.email.toString());
        print("------------------------------------");
        return Text("loading");
      },
    );
  }
}

class SertifikaBilgileri extends StatelessWidget {
  const SertifikaBilgileri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('Veritabani')
        .doc('Kullanicilar')
        .collection('Sertifika Bilgileri');

    return FutureBuilder<DocumentSnapshot>(
      future:
          users.doc(FirebaseAuth.instance.currentUser!.email.toString()).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print("veri geliş");
          return Container(
              width: 380,
              height: 120,
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
              ),
              child: Text(
                  "Aldığı Sertifika : ${data["KullaniciSertifikaAdi"]}\nAldığı Kurum : ${data["KullaniciVerenKurum"]}\nAldığı Tarih : ${data["KullaniciAlınmaTarihi"]}\n",
                  style: TextStyle(fontSize: 18)));
          //Text("Full Name: ${data['KullaniciAd']} ${data['KullaniciSoyad']}");
        }
        print("---------------------------------");
        print(FirebaseAuth.instance.currentUser!.email.toString());
        print("------------------------------------");
        return Text("loading");
      },
    );
  }
}
