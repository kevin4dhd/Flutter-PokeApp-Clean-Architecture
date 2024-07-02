import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoResultsWidgetList extends StatelessWidget {
  const NoResultsWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text(
            "No se ha encontrado ningún resultado.",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Image.asset(
            "assets/images/pikachu_sin_resultados.png",
            width: Get.width * 0.8,
          ),
        ],
      ),
    );
  }
}
