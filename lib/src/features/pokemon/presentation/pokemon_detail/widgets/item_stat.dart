import 'package:flutter/material.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon_stat.dart';

class ItemStat extends StatelessWidget {
  final PokemonStat stat;
  const ItemStat({
    super.key,
    required this.stat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 128,
          child: Text(
            stat.capitalizedName,
            style: const TextStyle(
              fontFamily: "Inter",
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          stat.baseStat.toString(),
          style: const TextStyle(
            fontFamily: "Inter",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0XFFEBC974),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: stat.baseStat / 100),
            duration: const Duration(seconds: 1),
            builder: (context, value, _) {
              return LinearProgressIndicator(
                value: value,
                backgroundColor: const Color(0X4DFFFFFF),
                color: const Color(0XFFEBC974),
                borderRadius: BorderRadius.circular(30),
                minHeight: 12,
              );
            },
          ),
        ),
      ],
    );
  }
}
