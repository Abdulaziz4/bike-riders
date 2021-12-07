import 'package:bike_riders/core/app/constants.dart';
import 'package:bike_riders/core/app/utils/colors_helper.dart';
import 'package:bike_riders/core/app/utils/location_helper.dart';
import 'package:bike_riders/core/models/group.dart';
import 'package:bike_riders/ui/shared/emoji_ring.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupDetailsView extends StatelessWidget {
  final Group group;
  const GroupDetailsView({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 2,
          horizontal: kDefaultPadding / 2,
        ),
        child: Column(
          children: [
            buildSection(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      EmojiRing(emoji: group.emoji),
                      Text(
                        group.title,
                        style: kLargeText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Text(
                    group.description,
                    style: kMediumText,
                  ),
                ],
              ),
            ),
            buildSection(
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDetailsChip(
                          "Distance",
                          group.distance.toStringAsFixed(2) + " KM",
                          "assets/icons/road_icon.svg",
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        buildDetailsChip(
                          "Level",
                          group.level,
                          "assets/icons/speometer_icon.svg",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildDetailsChip(
                          "Number of Bikers",
                          group.participents.toString(),
                          "assets/icons/bike-icon.svg",
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        buildDetailsChip(
                          "City",
                          "Riyadh",
                          "assets/icons/pin_icon.svg",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            buildSection(
              Column(
                children: [
                  Text(
                    "${group.date.year.toString()}-${group.date.month.toString().padLeft(2, '0')}-${group.date.day.toString().padLeft(2, '0')}",
                    style: kMediumText.copyWith(fontSize: 17),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: double.infinity,
                    height: 0.2,
                    color: kAltColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Start Time",
                            style: kMediumText.copyWith(fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            group.startTime.format(context),
                            style: kMediumText.copyWith(fontSize: 17),
                          ),
                        ],
                      ),
                      Container(
                        height: 70,
                        width: 0.2,
                        color: kAltColor,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "End Time",
                            style: kMediumText.copyWith(fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            group.endTime.format(context),
                            style: kMediumText.copyWith(fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildSection(
              Column(
                children: [
                  Image.network(group.locationPreview),
                  TextButton(
                    onPressed: lunchMapUrl,
                    child: Text(
                      group.address,
                      style: kMediumText.copyWith(
                        color: kSecondryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: brighten(kPrimaryColor, 8),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 0.2,
          color: Colors.white,
        ),
      ),
      child: child,
    );
  }

  Container buildDetailsChip(String label, String text, String icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            icon,
            fit: BoxFit.cover,
            height: 25,
            width: 25,
            color: kSecondryColor,
          ),
          SizedBox(
            width: kDefaultPadding / 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void lunchMapUrl() async {
    String url = LocationHelper.mapLocationUrlFromLatLng(group.location);
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
