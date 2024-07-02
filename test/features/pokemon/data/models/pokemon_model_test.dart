import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_model.dart';

void main() {
  group('PokemonModel', () {
    test('fromJson should create a valid PokemonModel', () {
      final json = {
        'name': 'bulbasaur',
        'url': 'https://pokeapi.co/api/v2/pokemon/1/',
      };

      final detailsJson = {
        'weight': 69,
        'height': 7,
        'types': [
          {
            'type': {'name': 'grass'}
          }
        ],
        'stats': [
          {
            'stat': {'name': 'hp'},
            'base_stat': 45
          }
        ],
        'moves': [
          {
            'move': {'name': 'razor-wind'}
          }
        ],
      };

      final pokemon = PokemonModel.fromJson(json, detailsJson);

      expect(pokemon.name, 'bulbasaur');
      expect(pokemon.id, 1);
      expect(pokemon.imageUrl,
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png");
      expect(pokemon.details.weight, 69);
      expect(pokemon.details.height, 7);
      expect(pokemon.details.types.first.name, 'grass');
      expect(pokemon.details.stats.first.name, 'hp');
      expect(pokemon.details.stats.first.baseStat, 45);
      expect(pokemon.details.moves.first.name, 'razor-wind');
    });
  });
}
