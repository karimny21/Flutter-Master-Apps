import 'package:flutter/material.dart';
import 'package:metouch/utility/mystyle.dart';

class Authen extends StatefulWidget {
  // const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            showlogo(),
            Mystyle().titleH1('My IoT Apps'),
            buildUser(),
            buildPassword(),
          ],
        ),
      ),
    );
  }

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
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
