import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("fb.png"),
          iconSize: 40,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset("linkedin.png"),
          iconSize: 40,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset("twitter.png"),
          iconSize: 40,
        ),
      ],
    );
  }
}
