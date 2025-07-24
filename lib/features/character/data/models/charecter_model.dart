import 'package:rick_api/features/character/domain/entities/character.dart';

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String origin;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      gender: json['gender'] as String,
      origin: json['origin']['name'] as String, // origem é um objeto
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'origin': {'name': origin}, // reconstrói o objeto JSON original
      'image': image,
    };
  }

  Character toEntity() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      gender: gender,
      origin: origin,
      image: image,
    );
  }
}
