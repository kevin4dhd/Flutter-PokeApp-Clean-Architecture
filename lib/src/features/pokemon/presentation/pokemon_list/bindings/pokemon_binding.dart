import 'package:get/get.dart';
import 'package:pokemon/src/features/pokemon/data/providers/pokemon_provider.dart';
import 'package:pokemon/src/features/pokemon/data/repositories/pokemon_repository.dart';
import 'package:pokemon/src/features/pokemon/domain/repositories/abstract_pokemon_repository.dart';
import 'package:pokemon/src/features/pokemon/domain/usecases/filter_pokemons_by_name.dart';
import 'package:pokemon/src/features/pokemon/domain/usecases/get_pokemons.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/controllers/pokemon_controller.dart';

class PokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonProvider>(() => PokemonProvider());
    Get.lazyPut<AbstractPokemonRepository>(
      () => PokemonRepositoryImpl(Get.find()),
    );
    Get.lazyPut(() => GetPokemons(Get.find()));
    Get.lazyPut(() => FilterPokemonsByName(Get.find()));
    Get.lazyPut(() => PokemonController(
          getPokemons: Get.find(),
          filterPokemonsByName: Get.find(),
        ));
  }
}
