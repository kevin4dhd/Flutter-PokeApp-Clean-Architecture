import 'package:flutter/material.dart';
import 'package:pokemon/src/core/helpers/pokemon_helper.dart';
import 'package:pokemon/src/core/utils/color_util.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';

class PrincipalStatsDetail extends StatefulWidget {
  final Pokemon pokemon;
  const PrincipalStatsDetail({super.key, required this.pokemon});

  @override
  PrincipalStatsDetailState createState() => PrincipalStatsDetailState();
}

class PrincipalStatsDetailState extends State<PrincipalStatsDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "${pokemon.height} M",
              style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              "Height",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: _startAnimation,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value * 2 * 3.141592653589793,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: ColorUtil.hexToColor(pokemon.dominantColor),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      getIconByType(pokemon.type),
                      style: const TextStyle(
                        fontFamily: "PokeGoTypes",
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Column(
          children: [
            Text(
              "${pokemon.weight} KG",
              style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              "Weight",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
