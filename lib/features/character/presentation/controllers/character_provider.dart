import 'package:flutter/material.dart';
import 'package:rick_api/features/character/domain/entities/character.dart';
import 'package:rick_api/features/character/domain/usecases/fetch_all_characters.dart';

class CharacterProvider extends ChangeNotifier {
  final FetchAllCharacters fetchAllCharacters;

  CharacterProvider({required this.fetchAllCharacters});
  List<Character> _characters = [];
  List<Character> get characters => _characters;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadCharacters() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _characters = await fetchAllCharacters();
    } catch (e) {
      _error = 'Erro ao buscar personagens';
    }
    _isLoading = false;
    notifyListeners();
  }
}
