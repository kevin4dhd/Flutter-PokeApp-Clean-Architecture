import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokemon/src/core/routes/app_routes.dart';
import 'package:pokemon/src/core/utils/color_util.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/controllers/pokemon_controller.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final PokemonController controller = Get.find();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Get.toNamed(
          AppRoutes.pokemonDetail,
          arguments: pokemon,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            color: ColorUtil.hexToColor(pokemon.dominantColor),
            child: Stack(
              children: [
                Center(
                  child: FractionallySizedBox(
                    heightFactor: 0.8,
                    child: Hero(
                      tag: 'pokemonImage${pokemon.id}',
                      child: Image(
                        image: FastCachedImageProvider(pokemon.imageUrl),
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                              'assets/images/image_not_found.png');
                        },
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: 1,
                  widthFactor: 1,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                        stops: const [0.5, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: Obx(() {
                    final isFavorite = controller.isFavorite(pokemon.id);
                    return SvgPicture.asset(
                      isFavorite
                          ? "assets/svg_images/favorite_small.svg"
                          : "assets/svg_images/favorite_small_border.svg",
                      width: 20,
                      height: 20,
                    );
                  }),
                ),
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12.5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          pokemon.capitalizedName,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset(
                        "assets/svg_images/arrow_circle_right.svg",
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
