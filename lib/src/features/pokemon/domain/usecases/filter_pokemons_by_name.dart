import 'package:dartz/dartz.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/domain/repositories/abstract_pokemon_repository.dart';
import 'package:pokemon/src/core/network/error/failures.dart';

class FilterPokemonsByName {
  final AbstractPokemonRepository repository;

  FilterPokemonsByName(this.repository);

  Future<Either<Failure, List<Pokemon>>> call(String name, int offset) async {
    final Either<Failure, List<PokemonModel>> result =
        await repository.filterPokemonsByName(name, offset);
    return result.fold(
      (failure) => Left(failure),
      (models) async {
        List<Pokemon> pokemons = models.map((model) {
          return Pokemon.fromModel(model);
        }).toList();
        return Right(pokemons);
      },
    );
  }
}
