import 'package:flutter_graphql_example/data/character_dto.dart';
import 'package:flutter_graphql_example/data/character_mapper.dart';
import 'package:flutter_graphql_example/data/characters_query.dart';
import 'package:flutter_graphql_example/domain/character.dart';
import 'package:flutter_graphql_example/domain/characters_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final _client = GraphQLClient(
      link: HttpLink("https://rickandmortyapi.com/graphql"),
      cache: GraphQLCache());

  final mapper = CharacterMapper();

  @override
  Future<List<Character>> getCharacters() async {
    try {
      return _client
          .query(
        QueryOptions(
          document: gql(CharactersQuery.readRepositories),
          fetchPolicy: FetchPolicy.noCache,
        ),
      )
          .then((result) {
        if (result.hasException) {
          throw Exception(result.exception);
        }

        return CharacterDto.fromJsonArray(
            result.data!["characters"]["results"]);
      }).then((dtos) => mapper.fromGraphqlDtoList(dtos));
    } catch (error) {
      throw Exception(error);
    }
  }
}
