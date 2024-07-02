import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon_move.dart';

class ItemMoves extends StatelessWidget {
  final List<PokemonMove> moves;
  const ItemMoves({super.key, required this.moves});

  @override
  Widget build(BuildContext context) {
    final limitedMoves = moves.length > 8 ? moves.sublist(0, 8) : moves;

    return AnimationLimiter(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 500),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: limitedMoves.map((move) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0X33FFFFFF),
                borderRadius: BorderRadius.circular(30),
                border: const Border(
                  bottom: BorderSide(
                    color: Color(0x80FFFFFF),
                    width: 1.0,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                move.capitalizedName,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
