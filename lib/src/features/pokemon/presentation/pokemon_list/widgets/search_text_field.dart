import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  final void Function(String)? onChanged;

  const SearchTextField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg_images/search.svg",
                width: 24,
                height: 24,
              ),
            ],
          ),
          hintText: 'Buscar',
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    );
  }
}
