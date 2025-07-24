import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:rick_api/features/character/data/datasources/character_api.dart';
import 'package:rick_api/features/character/data/repositories/character_repository_impl.dart';
import 'package:rick_api/features/character/domain/usecases/fetch_all_characters.dart';
import 'package:rick_api/features/character/presentation/controllers/character_provider.dart';

final providers = <ChangeNotifierProvider>[
  ChangeNotifierProvider(
    create: (_) {
      final dio = Dio();
      final api = CharacterApi(dio: dio);
      final repository = CharacterRepositoryImpl(api: api);
      final usecase = FetchAllCharacters(repository: repository);
      return CharacterProvider(fetchAllCharacters: usecase)..loadCharacters();
    },
  ),
];
