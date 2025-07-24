import 'package:flutter/material.dart';
import 'package:rick_api/features/character/domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(character.image),
        title: Text(character.name),
        subtitle: Text('ID: ${character.id}'),
      ),
    );
  }
}
