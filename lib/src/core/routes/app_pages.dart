import 'package:get/get.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/bindings/pokemon_binding.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_detail/pages/pokemon_detail_page.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/pages/pokemon_list_page.dart';
import 'package:pokemon/src/core/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.pokemonList,
      page: () => const PokemonListPage(),
      binding: PokemonBinding(),
    ),
    GetPage(
      name: AppRoutes.pokemonDetail,
      page: () => const PokemonDetailPage(),
      binding: PokemonBinding(),
    ),
  ];
}
