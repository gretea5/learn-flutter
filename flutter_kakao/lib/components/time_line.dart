import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({
    super.key,
    required this.time,
  });
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFF9Cafbe),
      ),
      child: Text(
        time,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
