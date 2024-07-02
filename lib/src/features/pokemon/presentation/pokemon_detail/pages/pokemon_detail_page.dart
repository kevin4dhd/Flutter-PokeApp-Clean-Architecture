import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_detail/widgets/card_image_detail.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_detail/widgets/container_tab_detail.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_detail/widgets/header_pokemon_detail.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_detail/widgets/item_moves.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_detail/widgets/item_stat.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_detail/widgets/principal_stats_detail.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({super.key});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = Get.arguments as Pokemon;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 26,
                ),
                HeaderPokemonDetail(pokemon: pokemon),
                const SizedBox(
                  height: 57,
                ),
                CardImageDetail(
                  pokemon: pokemon,
                ),
                const SizedBox(
                  height: 34,
                ),
                PrincipalStatsDetail(pokemon: pokemon),
                const SizedBox(
                  height: 36,
                ),
                Container(
                  color: Colors.black,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: const Color(0XFF999999),
                    dividerColor: Colors.transparent,
                    indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: const [
                      Tab(text: 'Stats'),
                      Tab(text: 'Moves'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                _selectedIndex == 0
                    ? ContainerTabDetail(
                        child: Column(
                          children: pokemon.stats
                              .map((stat) => Column(
                                    children: [
                                      ItemStat(stat: stat),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ),
                      )
                    : ContainerTabDetail(
                        child: ItemMoves(
                            moves: pokemon.moves.map((move) => move).toList()),
                      ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
