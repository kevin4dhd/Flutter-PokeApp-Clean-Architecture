import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pokemon/src/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon/src/core/network/error/failures.dart';
import 'package:dartz/dartz.dart';

class PokemonProvider {
  final String baseUrl = 'https://pokeapi.co/api/v2';

  Future<Either<Failure, List<PokemonModel>>> getPokemons(int offset) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/pokemon?offset=$offset&limit=20'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'] as List;

        final pokemons = await Future.wait(results.map((pokemon) async {
          final pokemonId = _extractIdFromUrl(pokemon['url']);
          final detailData =
              await _getPokemonDetailData(pokemonId, pokemon['url']);
          return PokemonModel.fromJson(pokemon, detailData);
        }).toList());

        return Right(pokemons);
      } else {
        return Left(ServerFailure('Failed to load pokemons'));
      }
    } catch (e) {
      return Left(NetworkFailure('Network error occurred'));
    }
  }

  Future<Either<Failure, List<PokemonModel>>> filterPokemonsByName(
    String name,
    int offset,
  ) async {
    const int limit = 20;
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/pokemon?offset=0&limit=2000'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'] as List;

        final filteredPokemons = results
            .where((pokemon) =>
                pokemon['name'].toLowerCase().contains(name.toLowerCase()))
            .toList();

        if (offset >= filteredPokemons.length) {
          return const Right([]);
        }

        final end = (offset + limit) > filteredPokemons.length
            ? filteredPokemons.length
            : offset + limit;

        final paginatedPokemons = filteredPokemons.sublist(offset, end);

        final pokemons =
            await Future.wait(paginatedPokemons.map((pokemon) async {
          final pokemonId = _extractIdFromUrl(pokemon['url']);
          final detailData =
              await _getPokemonDetailData(pokemonId, pokemon['url']);
          return PokemonModel.fromJson(pokemon, detailData);
        }).toList());

        return Right(pokemons);
      } else {
        return Left(ServerFailure('Failed to load all pokemons'));
      }
    } catch (e) {
      return Left(NetworkFailure('Network error occurred'));
    }
  }

  Future<Map<String, dynamic>> _getPokemonDetailData(
      int pokemonId, String url) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('pokemon_$pokemonId');

    if (cachedData != null) {
      return json.decode(cachedData);
    } else {
      final detailResponse = await http.get(Uri.parse(url));
      if (detailResponse.statusCode == 200) {
        final detailData = json.decode(detailResponse.body);
        await prefs.setString('pokemon_$pokemonId', json.encode(detailData));
        return detailData;
      } else {
        throw ServerFailure('Failed to load pokemon details');
      }
    }
  }

  int _extractIdFromUrl(String url) {
    final uri = Uri.parse(url);
    return int.parse(uri.pathSegments[uri.pathSegments.length - 2]);
  }
}
