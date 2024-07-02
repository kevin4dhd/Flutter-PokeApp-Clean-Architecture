import 'package:dartz/dartz.dart';
import 'package:pokemon/src/core/network/error/failures.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_model.dart';

abstract class AbstractPokemonRepository {
  Future<Either<Failure, List<PokemonModel>>> fetchPokemons(int offset);
  Future<Either<Failure, List<PokemonModel>>> filterPokemonsByName(
      String name, int offset);
  //Future<PokemonModel> fetchPokemonDetail(String name);
}
