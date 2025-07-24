import 'package:rick_api/features/character/domain/entities/character.dart';
import 'package:rick_api/features/character/domain/repositories/character_repository.dart';

class FetchAllCharacters {
  final CharacterRepository repository;

  FetchAllCharacters({required this.repository});

  Future<List<Character>> call() {
    return repository.fetchAllCharacters();
  }
}
