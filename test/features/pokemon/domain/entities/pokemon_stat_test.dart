import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon_stat.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_stat_model.dart';

void main() {
  group('PokemonStat', () {
    test(
        'capitalizedName should capitalize the first letter and replace hyphens with spaces',
        () {
      final stat = PokemonStat(name: 'special-attack', baseStat: 100);
      expect(stat.capitalizedName, 'Special attack');
    });

    test('capitalizedName should handle empty string', () {
      final stat = PokemonStat(name: '', baseStat: 100);
      expect(stat.capitalizedName, '');
    });

    test('fromModel should create PokemonStat from model', () {
      final model = PokemonStatModel(name: 'defense', baseStat: 85);
      final stat = PokemonStat.fromModel(model);
      expect(stat.name, 'defense');
      expect(stat.baseStat, 85);
      expect(stat.capitalizedName, 'Defense');
    });
  });
}
