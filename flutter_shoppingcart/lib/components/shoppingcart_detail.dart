import 'package:flutter/material.dart';

class ShoppingCartDetail extends StatelessWidget {
  const ShoppingCartDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            _buildDetailNameAndPrice(),
            _buildRatingAndReviewCount(),
            _buildDetailColorOptions(),
            _buildDetailButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailNameAndPrice() {
    return const Padding(
      padding: EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Urban Soft AL 10.0",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$699",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRatingAndReviewCount() {
    return const Padding(
      padding: EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Spacer(),
          Text("review "),
          Text(
            "(26)",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailColorOptions() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Color Options"),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _buildDetailIcons(
                Colors.black,
              ),
              _buildDetailIcons(
                Colors.green,
              ),
              _buildDetailIcons(
                Colors.orange,
              ),
              _buildDetailIcons(
                Colors.grey,
              ),
              _buildDetailIcons(
                Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Stack
  Widget _buildDetailIcons(Color mColor) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: 5,
            top: 5,
            child: ClipOval(
              child: Container(
                width: 40,
                height: 40,
                color: mColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailButton() {
    return const SizedBox();
  }
}
