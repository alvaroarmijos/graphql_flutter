class CharacterDto {
  final String id;
  final String name;
  final String species;

  CharacterDto({
    required this.id,
    required this.name,
    required this.species,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) => CharacterDto(
        id: json["id"],
        name: json["name"],
        species: json["species"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "species": species,
      };

  static List<CharacterDto> fromJsonArray(List jsonArray) =>
      jsonArray.map((e) => CharacterDto.fromJson(e)).toList();
}
