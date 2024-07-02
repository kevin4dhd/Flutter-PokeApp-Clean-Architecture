import 'package:pokemon/src/features/pokemon/data/models/pokemon_stat_model.dart';

class PokemonStat {
  final String name;
  final int baseStat;

  PokemonStat({
    required this.name,
    required this.baseStat,
  });

  factory PokemonStat.fromModel(PokemonStatModel model) {
    return PokemonStat(
      name: model.name,
      baseStat: model.baseStat,
    );
  }

  String get capitalizedName {
    if (name.isEmpty) return name;
    String formattedName = name.replaceAll('-', ' ');
    return formattedName[0].toUpperCase() + formattedName.substring(1);
  }
}
