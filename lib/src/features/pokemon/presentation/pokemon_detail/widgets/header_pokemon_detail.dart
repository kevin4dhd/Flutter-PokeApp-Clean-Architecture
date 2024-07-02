import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokemon/src/core/utils/text_marquee.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/controllers/pokemon_controller.dart';

class HeaderPokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  const HeaderPokemonDetail({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final PokemonController controller = Get.find();
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.asset(
            "assets/svg_images/back.svg",
            width: 36,
            height: 36,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Center(
            child: TextMarquee(
              pokemon.capitalizedName,
              style: const TextStyle(
                fontSize: 40,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
              ),
              duration: const Duration(seconds: 10),
              spaceSize: 50.0,
              startPaddingSize: 10.0,
              delay: const Duration(seconds: 1),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Obx(() {
          final isFavorite = controller.isFavorite(pokemon.id);
          return IconButton(
            icon: SvgPicture.asset(
              isFavorite
                  ? "assets/svg_images/favorite_small_36.svg"
                  : "assets/svg_images/favorite_small_border_36.svg",
              width: 36,
              height: 36,
            ),
            onPressed: () {
              controller.toggleFavorite(pokemon.id);
            },
          );
        }),
      ],
    );
  }
}
