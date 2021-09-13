import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metouch/body/showmornitor.dart';
import 'package:metouch/utility/dialog.dart';
import 'package:metouch/utility/mystyle.dart';

class Authen extends StatefulWidget {
  // const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double screen;
  String user, password;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.tealAccent[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showlogo(),
            SizedBox(
              height: 10,
            ),
            Mystyle().titleH1('My IoT Apps'),
            buildUser(),
            buildPassword(),
            buildLogin(),
          ],
        ),
      ),
    );
  }

  Container buildLogin() {
    return Container(
      width: screen * 0.6,
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Mystyle().bluelight),
        onPressed: () {
          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            normalDialog(context, 'Have Space', 'Please Fill Every Blank');
          } else {
            print('user=$user  password= $password');
            checkAuthen();
          }
        },
        child: Text('Login'),
      ),
    );
  }

  Future<Null> checkAuthen() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: user, password: password)
          .then((value) {
        var myServiceRoute = MaterialPageRoute(
            builder: (BuildContext context) => ShowMornitor());
        Navigator.of(context)
            .pushAndRemoveUntil(myServiceRoute, (route) => false);
      }).catchError((onError) =>
              normalDialog(context, onError.code, onError.message));
    });
  }

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.perm_identity,
            color: Mystyle().bluedark,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Mystyle().bluelight),
          ),
          labelStyle: TextStyle(color: Mystyle().bluelight),
          labelText: 'User : ',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Mystyle().bluedark),
          ),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Mystyle().bluedark,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Mystyle().bluelight),
          ),
          labelStyle: TextStyle(color: Mystyle().bluelight),
          labelText: 'Password : ',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Mystyle().bluedark),
          ),
        ),
      ),
    );
  }

  Container showlogo() {
    return Container(
      width: screen * 0.3,
      child: Mystyle().showLogo(),
    );
  }
}
