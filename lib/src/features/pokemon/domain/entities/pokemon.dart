import 'package:pokemon/src/core/helpers/pokemon_helper.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon_move.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon_stat.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final String dominantColor;
  final double weight;
  final double height;
  final String type;
  final List<PokemonStat> stats;
  final List<PokemonMove> moves;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.dominantColor,
    required this.weight,
    required this.height,
    required this.type,
    required this.stats,
    required this.moves,
  });

  String get capitalizedName {
    if (name.isEmpty) return name;
    String formattedName = name.replaceAll('-', ' ');
    return formattedName[0].toUpperCase() + formattedName.substring(1);
  }

  factory Pokemon.fromModel(PokemonModel model) {
    return Pokemon(
      id: model.id,
      name: model.name,
      imageUrl: model.imageUrl,
      dominantColor: getColorFromType(model.details.types.first.name),
      type: model.details.types.first.name,
      weight: model.details.weight / 10.0,
      height: model.details.height / 10.0,
      stats: model.details.stats
          .map((stat) => PokemonStat.fromModel(stat))
          .toList(),
      moves: model.details.moves
          .map((move) => PokemonMove.fromModel(move))
          .toList(),
    );
  }
}
