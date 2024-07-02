import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/controllers/pokemon_controller.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/widgets/header_widget.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/widgets/loading_widget_list.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/widgets/error_widget_list.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/widgets/no_results_widget_list.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_list/widgets/search_text_field.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  PokemonListPageState createState() => PokemonListPageState();
}

class PokemonListPageState extends State<PokemonListPage> {
  final ScrollController _scrollController = ScrollController();
  late PokemonController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<PokemonController>();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      controller.fetchPokemons();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const HeaderWidget(),
              const SizedBox(
                height: 29,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Encuentra tu Pokemon",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchTextField(
                      onChanged: (value) {
                        controller.searchPokemons(value);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Obx(() {
                if (controller.isLoading.value && controller.pokemons.isEmpty) {
                  return const LoadingWidgetList();
                }
                if (controller.error.value.isNotEmpty) {
                  return ErrorWidgetList(message: controller.error.value);
                }
                if (controller.isLastPage.value &&
                    controller.pokemons.isEmpty) {
                  return const NoResultsWidgetList();
                }
                return Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.pokemons.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18.0,
                        crossAxisSpacing: 16.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 0,
                      ),
                      itemBuilder: (context, index) {
                        final pokemon = controller.pokemons[index];
                        return PokemonCard(pokemon: pokemon);
                      },
                    ),
                    if (controller.isLoading.value)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                );
              }),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
