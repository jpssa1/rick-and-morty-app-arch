import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_api/features/character/presentation/controllers/character_provider.dart';
import 'package:rick_api/features/character/presentation/widgets/character_card.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty')),
      body: Builder(
        builder: (_) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          return ListView.builder(
            itemCount: provider.characters.length,
            itemBuilder: (context, index) {
              final character = provider.characters[index];
              return CharacterCard(character: character);
            },
          );
        },
      ),
    );
  }
}
