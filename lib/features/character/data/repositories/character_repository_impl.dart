import 'package:rick_api/features/character/data/datasources/character_api.dart';
import 'package:rick_api/features/character/domain/entities/character.dart';
import 'package:rick_api/features/character/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterApi api;

  CharacterRepositoryImpl({required this.api});

  @override
  Future<List<Character>> fetchAllCharacters() async {
    final models = await api.fetchAllCharacters();
    return models.map((model) => model.toEntity()).toList();
  }
}
