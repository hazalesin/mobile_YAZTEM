import 'package:flutter/material.dart';
import 'package:database/theme/color.dart';

import '../auth.dart';
import '../veritabani.dart';
import 'egitim_page.dart';

class KayitSayfasi extends StatefulWidget {
  const KayitSayfasi({ Key? key }) : super(key: key);

  @override
  _KayitSayfasiState createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {

  bool isHiddenPassword=true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController = TextEditingController();

  AuthService _authService = AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: darkblue,
        ),
        child: Column(
          children: <Widget>[
          SizedBox(
              height: 140,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 14.0),
              child: Text(
                "Kayıt Oluştur",
                style: TextStyle(color: white, fontSize: 36),
              ),
            ),
            Expanded(
              child: Container(
                decoration:  BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 28, right: 28),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Adınız",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey, 
                          )
                        ),
                        controller: _nameController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Soyadınız",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey, 
                          )
                        ),
                        controller: _surnameController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Mail adresiniz",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey, 
                          )
                        ),
                        controller: _emailController,
                      ),
                      TextFormField(
                        obscureText: isHiddenPassword,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(Icons.visibility)
                          ),
                          hintText: "Sifreniz",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey, 
                          )
                        ),
                        controller: _passwordController,
                      ),
                      TextFormField(
                        obscureText: isHiddenPassword,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(Icons.visibility)
                          ),
                          hintText: "Sifre tekrar",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey, 
                          )
                        ),
                        controller: _passwordAgainController,
                      ),
                    
                      InkWell(
                      onTap: (){
                        _authService
                        .createPerson( 
                          _emailController.text,
                          _passwordController.text)
                          .then((value) {
                            VeritabaniIslemleri().kullaniciAdSoyadIletisim(_nameController.text, _surnameController.text, _emailController.text, _passwordController.text);
                            return Navigator.push(context, MaterialPageRoute(builder: (context) => EgitimPage()));
                          });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Center(child: Text(
                            "Kaydet",
                          ),),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _togglePasswordView(){
  setState(() {
    isHiddenPassword=!isHiddenPassword;
  });
  }
}
