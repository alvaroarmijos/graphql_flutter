import 'package:flutter_graphql_example/domain/character.dart';

abstract class CharactersRepository {
  Future<List<Character>> getCharacters();
}
