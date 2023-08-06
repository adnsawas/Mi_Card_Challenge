import 'dart:convert';
import 'package:mi_card/src/features/user_cards/models/person_details.dart';

/// This model is used by card design screen to build the business card step
/// by step
class CardDesign {
  final String? selectedTemplate;
  final PersonDetails? personDetails;
  CardDesign({
    this.selectedTemplate,
    this.personDetails,
  });

  CardDesign copyWith({
    String? selectedTemplate,
    PersonDetails? personDetails,
  }) {
    return CardDesign(
      selectedTemplate: selectedTemplate ?? this.selectedTemplate,
      personDetails: personDetails ?? this.personDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedTemplate': selectedTemplate,
      'personDetails': personDetails?.toMap(),
    };
  }

  factory CardDesign.fromMap(Map<String, dynamic> map) {
    return CardDesign(
      selectedTemplate: map['selectedTemplate'] != null
          ? map['selectedTemplate'] as String
          : null,
      personDetails: map['personDetails'] != null
          ? PersonDetails.fromMap(map['personDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardDesign.fromJson(String source) =>
      CardDesign.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CardDesign(selectedTemplate: $selectedTemplate, personDetails: $personDetails)';

  @override
  bool operator ==(covariant CardDesign other) {
    if (identical(this, other)) return true;

    return other.selectedTemplate == selectedTemplate &&
        other.personDetails == personDetails;
  }

  @override
  int get hashCode => selectedTemplate.hashCode ^ personDetails.hashCode;
}
