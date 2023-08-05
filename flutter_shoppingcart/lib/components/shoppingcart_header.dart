import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

class ShoppingCartHeader extends StatefulWidget {
  const ShoppingCartHeader({super.key});

  @override
  State<ShoppingCartHeader> createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  int selectedId = 0;

  List<String> selectedPic = [
    "assets/p1.jpeg",
    "assets/p2.jpeg",
    "assets/p3.jpeg",
    "assets/p4.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderPic(),
        _buildHeaderSelector(),
      ],
    );
  }

  Widget _buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[selectedId],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 10,
        bottom: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildHeaderSelectorButton(
            id: 0,
            mIcon: Icons.directions_bike,
          ),
          _buildHeaderSelectorButton(
            id: 1,
            mIcon: Icons.motorcycle,
          ),
          _buildHeaderSelectorButton(
            id: 2,
            mIcon: CupertinoIcons.car_detailed,
          ),
          _buildHeaderSelectorButton(
            id: 3,
            mIcon: CupertinoIcons.airplane,
          ),
        ],
      ),
    );
  }

  Container _buildHeaderSelectorButton(
      {required int id, required IconData mIcon}) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: selectedId == id ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            selectedId = id;
          });
        },
        icon: Icon(mIcon),
      ),
    );
  }
}
