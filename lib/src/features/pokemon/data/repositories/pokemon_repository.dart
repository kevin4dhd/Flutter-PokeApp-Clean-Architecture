import 'package:dartz/dartz.dart';
import 'package:pokemon/src/core/network/error/failures.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon/src/features/pokemon/data/providers/pokemon_provider.dart';
import 'package:pokemon/src/features/pokemon/domain/repositories/abstract_pokemon_repository.dart';

class PokemonRepositoryImpl extends AbstractPokemonRepository {
  final PokemonProvider provider;

  PokemonRepositoryImpl(this.provider);

  @override
  Future<Either<Failure, List<PokemonModel>>> fetchPokemons(int offset) async {
    return await provider.getPokemons(offset);
  }

  @override
  Future<Either<Failure, List<PokemonModel>>> filterPokemonsByName(
    String name,
    int offset,
  ) async {
    return await provider.filterPokemonsByName(name, offset);
  }
}
