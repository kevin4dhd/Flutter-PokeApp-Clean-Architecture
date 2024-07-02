import 'package:pokemon/src/features/pokemon/data/models/pokemon_detail_model.dart';

class PokemonModel {
  final String name;
  final int id;
  final String imageUrl;
  final PokemonDetailModel details;

  PokemonModel({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.details,
  });

  factory PokemonModel.fromJson(
      Map<String, dynamic> json, Map<String, dynamic> detailsJson) {
    final uri = Uri.parse(json['url']);
    final id = int.parse(uri.pathSegments[uri.pathSegments.length - 2]);

    return PokemonModel(
      name: json['name'],
      id: id,
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
      details: PokemonDetailModel.fromJson(detailsJson),
    );
  }
}
