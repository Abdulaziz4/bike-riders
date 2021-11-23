import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/core/app/utils/colors_helper.dart';
import 'package:bike_riders/core/models/group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupItem extends StatelessWidget {
  final Group group;
  const GroupItem({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: brighten(kPrimaryColor, 20),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: kDefaultPadding / 1.5),
      child: Row(
        children: [
          Container(
            height: double.maxFinite,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11),
                bottomLeft: Radius.circular(11),
              ),
              color: (kDecorationColors.toList()..shuffle()).first,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildEmojiRing(),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, bottom: 8, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          group.title,
                          style: kMediumText.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Text(
                            group.description,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            buildDetailsChip(
                              group.distance.toStringAsFixed(2) + " KM",
                              "assets/icons/road_icon.svg",
                            ),
                            buildDetailsChip(
                                group.level, "assets/icons/speometer_icon.svg"),
                            // buildDetailsChip(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDetailsChip(String text, String icon) {
    return Container(
      // height: 25,
      margin: const EdgeInsets.only(right: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: (kDetailsChipColors.toList()..shuffle()).first,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            icon,
            fit: BoxFit.cover,
            height: 19,
            width: 19,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }

  Container buildEmojiRing() {
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
        group.emoji,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
