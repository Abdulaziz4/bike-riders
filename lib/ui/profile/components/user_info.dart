import 'package:bike_riders/core/app/constants.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String email;
  final void Function() onLogout;
  const UserInfo({Key? key, required this.email, required this.onLogout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          "assets/icons/user_icon.png",
          height: 100,
          width: 100,
        ),
        Container(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              email,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xffF59078), fixedSize: Size(120, 30)),
              onPressed: onLogout,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ],
    );
  }
}
