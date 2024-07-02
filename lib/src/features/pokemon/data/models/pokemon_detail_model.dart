import 'package:pokemon/src/features/pokemon/data/models/pokemon_move_model.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_stat_model.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_type_model.dart';

class PokemonDetailModel {
  final List<PokemonTypeModel> types;
  final int weight;
  final int height;
  final List<PokemonStatModel> stats;
  final List<PokemonMoveModel> moves;

  PokemonDetailModel({
    required this.types,
    required this.weight,
    required this.height,
    required this.stats,
    required this.moves,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      types: (json['types'] as List)
          .map((typeInfo) => PokemonTypeModel.fromJson(typeInfo['type']))
          .toList(),
      weight: json['weight'],
      height: json['height'],
      stats: (json['stats'] as List)
          .map((statInfo) => PokemonStatModel.fromJson(statInfo))
          .toList(),
      moves: (json['moves'] as List)
          .map((moveInfo) => PokemonMoveModel.fromJson(moveInfo['move']))
          .toList(),
    );
  }
}
