import 'package:flutter/material.dart';
import 'package:flutter_graphql_example/data/characters_repository_impl.dart';

import '../../../domain/character.dart';

class HomeProvider with ChangeNotifier {
  final _repository = CharactersRepositoryImpl();

  Future<List<Character>> getCharacters() {
    return _repository.getCharacters();
  }
}
