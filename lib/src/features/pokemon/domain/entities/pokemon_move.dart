import 'package:pokemon/src/features/pokemon/data/models/pokemon_move_model.dart';

class PokemonMove {
  final String name;

  PokemonMove({
    required this.name,
  });

  factory PokemonMove.fromModel(PokemonMoveModel model) {
    return PokemonMove(
      name: model.name,
    );
  }

  String get capitalizedName {
    if (name.isEmpty) return name;
    String formattedName = name.replaceAll('-', ' ');
    return formattedName[0].toUpperCase() + formattedName.substring(1);
  }
}
