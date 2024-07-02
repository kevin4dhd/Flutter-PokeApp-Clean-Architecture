class PokemonMoveModel {
  final String name;

  PokemonMoveModel({required this.name});

  factory PokemonMoveModel.fromJson(Map<String, dynamic> json) {
    return PokemonMoveModel(
      name: json['name'],
    );
  }
}
