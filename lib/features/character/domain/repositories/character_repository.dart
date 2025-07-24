import 'package:rick_api/features/character/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> fetchAllCharacters();
}
