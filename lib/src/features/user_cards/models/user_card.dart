// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mi_card/src/features/user_cards/models/person_details.dart';

class UserCard {
  final String id;
  final String templateId;
  final PersonDetails data;
  UserCard({
    required this.id,
    required this.templateId,
    required this.data,
  });

  UserCard copyWith({
    String? id,
    String? templateId,
    PersonDetails? data,
  }) {
    return UserCard(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'templateId': templateId,
      'data': data.toMap(),
    };
  }

  factory UserCard.fromMap(Map<String, dynamic> map) {
    return UserCard(
      id: map['id'] as String,
      templateId: map['templateId'] as String,
      data: PersonDetails.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCard.fromJson(String source) =>
      UserCard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserCard(id: $id, templateId: $templateId, data: $data)';

  @override
  bool operator ==(covariant UserCard other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.templateId == templateId &&
        other.data == data;
  }

  @override
  int get hashCode => id.hashCode ^ templateId.hashCode ^ data.hashCode;
}
