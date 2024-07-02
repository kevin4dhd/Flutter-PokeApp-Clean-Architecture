import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_stat_model.dart';

void main() {
  group('PokemonStatModel', () {
    test('fromJson should create a valid PokemonStatModel', () {
      final json = {
        'stat': {'name': 'hp'},
        'base_stat': 45
      };

      final stat = PokemonStatModel.fromJson(json);

      expect(stat.name, 'hp');
      expect(stat.baseStat, 45);
    });
  });
}
