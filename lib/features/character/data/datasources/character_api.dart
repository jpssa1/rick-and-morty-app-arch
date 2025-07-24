import 'package:dio/dio.dart';
import 'package:rick_api/features/character/data/models/charecter_model.dart';

class CharacterApi {
  final Dio dio;

  CharacterApi({required this.dio});

  Future<List<CharacterModel>> fetchAllCharacters() async {
    final response = await dio.get('https://rickandmortyapi.com/api/character');

    final results = response.data['results'] as List<dynamic>;

    return results
        .map((json) => CharacterModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
