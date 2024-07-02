class PokemonStatModel {
  final String name;
  final int baseStat;

  PokemonStatModel({required this.name, required this.baseStat});

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) {
    return PokemonStatModel(
      name: json['stat']['name'],
      baseStat: json['base_stat'],
    );
  }
}
