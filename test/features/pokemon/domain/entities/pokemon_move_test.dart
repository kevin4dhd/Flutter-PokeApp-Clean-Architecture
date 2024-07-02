import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon_move.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_move_model.dart';

void main() {
  group('PokemonMove', () {
    test(
        'capitalizedName should capitalize the first letter and replace hyphens with spaces',
        () {
      final move = PokemonMove(name: 'quick-attack');
      expect(move.capitalizedName, 'Quick attack');
    });

    test('capitalizedName should handle empty string', () {
      final move = PokemonMove(name: '');
      expect(move.capitalizedName, '');
    });

    test('fromModel should create PokemonMove from model', () {
      final model = PokemonMoveModel(name: 'thunder-punch');
      final move = PokemonMove.fromModel(model);
      expect(move.name, 'thunder-punch');
      expect(move.capitalizedName, 'Thunder punch');
    });
  });
}
