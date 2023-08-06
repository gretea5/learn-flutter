import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/round_icon_button.dart';
import 'package:flutter_kakao/models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            user.backgroundImage,
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              FontAwesomeIcons.xmark,
              size: 30,
              color: Colors.white,
            ),
          ),
          actions: const [
            RoundIconButton(
              icon: FontAwesomeIcons.gift,
            ),
            SizedBox(
              width: 15,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.gear,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
