import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWidgetList extends StatelessWidget {
  const LoadingWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Buscando...",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "Poppins",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Image.asset(
          "assets/images/pikachu_search.png",
          width: Get.width * 0.8,
        ),
      ],
    );
  }
}
