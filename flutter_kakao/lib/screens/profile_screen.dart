import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/bottom_icon_button.dart';
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
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            const Spacer(),
            _buildMainStory(),
            user.name == me.name ? _buildMyIcons() : _buildFriendIcons(),
          ],
        ),
      ),
    );
  }

  Column _buildMainStory() {
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(user.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          user.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          user.intro,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          maxLines: 1,
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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
    );
  }

  Widget _buildMyIcons() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(
            icon: FontAwesomeIcons.comment,
            text: "나와의 채팅",
          ),
          SizedBox(
            width: 50,
          ),
          BottomIconButton(
            icon: FontAwesomeIcons.pen,
            text: "프로필 편집",
          ),
        ],
      ),
    );
  }

  Widget _buildFriendIcons() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(
            icon: FontAwesomeIcons.comment,
            text: "1:1 채팅",
          ),
          SizedBox(
            width: 50,
          ),
          BottomIconButton(
            icon: FontAwesomeIcons.phone,
            text: "통화하기",
          ),
        ],
      ),
    );
  }
}
