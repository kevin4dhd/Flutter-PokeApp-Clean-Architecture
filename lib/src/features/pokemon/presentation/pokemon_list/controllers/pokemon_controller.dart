import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pokemon/src/core/network/error/failures.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/domain/usecases/filter_pokemons_by_name.dart';
import 'package:pokemon/src/features/pokemon/domain/usecases/get_pokemons.dart';
import 'package:flutter/scheduler.dart';

class PokemonController extends GetxController {
  final GetPokemons getPokemons;
  final FilterPokemonsByName filterPokemonsByName;

  PokemonController({
    required this.getPokemons,
    required this.filterPokemonsByName,
  });

  var pokemons = <Pokemon>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;
  var offset = 0;
  var isLastPage = false.obs;
  var query = ''.obs;
  var currentSearchId = 0;
  var favoritePokemonIds = <int>[].obs;

  @override
  void onInit() {
    debounce(query, (queryLocal) => _fetchPokemons(++currentSearchId),
        time: const Duration(milliseconds: 500));
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _fetchPokemons(currentSearchId);
    });
    super.onInit();
  }

  void fetchPokemons() {
    if (isLoading.value) return;
    _fetchPokemons(++currentSearchId);
  }

  void _fetchPokemons(int searchId) async {
    if (isLastPage.value) return;
    isLoading(true);
    error('');
    try {
      Either<Failure, List<Pokemon>> result;
      if (query.value.isEmpty) {
        result = await getPokemons(offset);
      } else {
        result = await filterPokemonsByName(query.value, offset);
      }
      if (currentSearchId == searchId) {
        result.fold(
          (failure) {
            error(failure.message);
          },
          (newPokemons) {
            if (newPokemons.isEmpty) {
              isLastPage(true);
            } else {
              pokemons.addAll(newPokemons);
              offset += 20;
            }
          },
        );
      }
    } catch (e) {
      if (currentSearchId == searchId) {
        error(e.toString());
      }
    } finally {
      if (currentSearchId == searchId) {
        isLoading(false);
      }
    }
  }

  void searchPokemons(String query) async {
    pokemons.clear();
    offset = 0;
    isLastPage(false);
    this.query.value = query;
  }

  void toggleFavorite(int pokemonId) {
    if (favoritePokemonIds.contains(pokemonId)) {
      favoritePokemonIds.remove(pokemonId);
    } else {
      favoritePokemonIds.add(pokemonId);
    }
  }

  bool isFavorite(int pokemonId) {
    return favoritePokemonIds.contains(pokemonId);
  }
}
