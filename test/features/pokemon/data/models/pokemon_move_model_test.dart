import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_move_model.dart';

void main() {
  group('PokemonMoveModel', () {
    test('fromJson should create a valid PokemonMoveModel', () {
      final json = {'name': 'razor-wind'};

      final move = PokemonMoveModel.fromJson(json);

      expect(move.name, 'razor-wind');
    });
  });
}
