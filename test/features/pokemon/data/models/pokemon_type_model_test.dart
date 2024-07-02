import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_type_model.dart';

void main() {
  group('PokemonTypeModel', () {
    test('fromJson should create a valid PokemonTypeModel', () {
      final json = {'name': 'grass'};

      final type = PokemonTypeModel.fromJson(json);

      expect(type.name, 'grass');
    });
  });
}
