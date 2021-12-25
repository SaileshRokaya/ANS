import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // ignore: sized_box_for_whitespace
      child: Container(
        height: 162,
        width: 400,
        child: Image.asset(
          "assets/images/notification.jpg",
          height: 160,
          width: 380,
        ),
      ),
    );
  }
}
