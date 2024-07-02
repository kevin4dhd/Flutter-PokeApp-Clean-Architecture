import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorWidgetList extends StatelessWidget {
  final String message;
  const ErrorWidgetList({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            "Error: $message",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
              color: Colors.redAccent,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Image.asset(
            "assets/images/pikachu_error.png",
            width: Get.width * 0.8,
          ),
        ],
      ),
    );
  }
}
