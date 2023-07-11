import 'package:flutter_graphql_example/data/character_dto.dart';
import 'package:flutter_graphql_example/domain/character.dart';

class CharacterMapper {
  Character fromGraphqlDto(CharacterDto dto) {
    final id = dto.id;
    final name = dto.name;
    final species = dto.species;

    return Character(id: id, name: name, species: species);
  }

  List<Character> fromGraphqlDtoList(List<CharacterDto> dtos) =>
      dtos.map((dto) => fromGraphqlDto(dto)).toList();
}
