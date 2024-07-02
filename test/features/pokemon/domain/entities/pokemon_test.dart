import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_detail_model.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_type_model.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_move_model.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_stat_model.dart';

void main() {
  group('Pokemon', () {
    test(
        'capitalizedName should capitalize the first letter and replace hyphens with spaces',
        () {
      final pokemon = Pokemon(
        id: 1,
        name: 'charizard-mega',
        imageUrl: 'url',
        dominantColor: 'red',
        weight: 90.5,
        height: 17.0,
        type: 'fire',
        stats: [],
        moves: [],
      );
      expect(pokemon.capitalizedName, 'Charizard mega');
    });

    test('capitalizedName should handle empty string', () {
      final pokemon = Pokemon(
        id: 1,
        name: '',
        imageUrl: 'url',
        dominantColor: 'red',
        weight: 90.5,
        height: 17.0,
        type: 'fire',
        stats: [],
        moves: [],
      );
      expect(pokemon.capitalizedName, '');
    });

    test('fromModel should create Pokemon from model', () {
      final model = PokemonModel(
        id: 1,
        name: 'charizard-mega',
        imageUrl: 'url',
        details: PokemonDetailModel(
          weight: 905,
          height: 170,
          types: [PokemonTypeModel(name: 'fire')],
          stats: [PokemonStatModel(name: 'attack', baseStat: 130)],
          moves: [PokemonMoveModel(name: 'flamethrower')],
        ),
      );
      final pokemon = Pokemon.fromModel(model);
      expect(pokemon.id, 1);
      expect(pokemon.name, 'charizard-mega');
      expect(pokemon.imageUrl, 'url');
      expect(pokemon.dominantColor, '#EE8130');
      expect(pokemon.type, 'fire');
      expect(pokemon.weight, 90.5);
      expect(pokemon.height, 17.0);
      expect(pokemon.stats.length, 1);
      expect(pokemon.stats.first.name, 'attack');
      expect(pokemon.stats.first.baseStat, 130);
      expect(pokemon.moves.length, 1);
      expect(pokemon.moves.first.name, 'flamethrower');
    });
  });
}
