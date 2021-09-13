import 'package:flutter/material.dart';
import 'package:metouch/utility/mystyle.dart';

Future<Null> normalDialog(
    BuildContext buildContext, String title, String message) async {
  showDialog(
    context: buildContext,
    builder: (BuildContext) => SimpleDialog(
      title: ListTile(
        leading: Mystyle().showLogo(),
        title: Mystyle().titleH1(title),
        subtitle: Mystyle().titleH3Button(message),
      ),
      children: [
        TextButton(
          onPressed: () => Navigator.pop(buildContext),
          child: Mystyle().titleH2('OK'),
        ),
      ],
    ),
  );
}
