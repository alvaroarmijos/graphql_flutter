class CharactersQuery {
  CharactersQuery._();

  static String readRepositories = """
  query CharactersList {
    characters{
        results {
            id
            name
            species
        }
    }
}
""";
}
