import 'package:flutter/material.dart';
import 'package:mi_card/src/features/user_cards/models/person_details.dart';

abstract class CardTemplate extends StatelessWidget {
  final PersonDetails personDetails;
  final bool withShadow;

  const CardTemplate(this.personDetails, {super.key, this.withShadow = true});
}
