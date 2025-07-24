import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_api/features/character/data/datasources/character_api.dart';
import 'package:rick_api/features/character/data/repositories/character_repository_impl.dart';
import 'package:rick_api/features/character/domain/usecases/fetch_all_characters.dart';
import 'package:rick_api/features/character/presentation/controllers/character_provider.dart';
import 'package:rick_api/features/character/presentation/pages/character_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CharacterProvider>(
          create: (_) {
            final dio = Dio();
            final api = CharacterApi(dio: dio);
            final repository = CharacterRepositoryImpl(api: api);
            final usecase = FetchAllCharacters(repository: repository);
            return CharacterProvider(fetchAllCharacters: usecase)
              ..loadCharacters();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Rick and Morty App',
        theme: ThemeData(useMaterial3: true),
        home: const CharacterListPage(),
      ),
    );
  }
}
