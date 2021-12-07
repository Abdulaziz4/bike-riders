import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';

class EmojiRing extends StatelessWidget {
  const EmojiRing({
    Key? key,
    required this.emoji,
  }) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: kDefaultPadding / 3,
        left: 6,
      ),
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 7,
          color: kPurpleColor,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        emoji,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
