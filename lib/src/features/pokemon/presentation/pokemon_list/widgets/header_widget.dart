import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/svg_images/menu.svg",
            width: 27,
            height: 18,
          ),
          ClipOval(
            child: Image.asset(
              "assets/images/user.jpeg",
              height: 36,
              width: 36,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
