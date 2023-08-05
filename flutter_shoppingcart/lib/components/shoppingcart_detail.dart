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
      child: Column(
        children: [
          _buildDetailNameAndPrice(),
          _buildRatingAndReviewCount(),
          _buildDetailColorOptions(),
          _buildDetailButton(),
        ],
      ),
    );
  }

  Widget _buildDetailNameAndPrice() {
    return const SizedBox();
  }

  Widget _buildRatingAndReviewCount() {
    return const SizedBox();
  }

  Widget _buildDetailColorOptions() {
    return const SizedBox();
  }

  Widget _buildDetailIcons() {
    return const SizedBox();
  }

  Widget _buildDetailButton() {
    return const SizedBox();
  }
}
