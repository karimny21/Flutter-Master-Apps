import 'dart:ui';

import 'package:flutter/material.dart';

class Mystyle {
  Color bluedark = Color(0xff002f6c);
  Color bluelight = Color(0xff4f83cc);
  Color blue = Color(0xff212121);

  Widget titleH1(String string) => Text(string,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: bluedark,
      ));
  Widget showLogo() => Image(
        image: AssetImage('images/logo.png'),
      );

  Mystyle();
}
