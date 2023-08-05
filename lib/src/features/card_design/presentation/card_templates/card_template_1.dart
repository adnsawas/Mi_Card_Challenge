import 'package:flutter/material.dart';
import 'package:mi_card/src/constants/gaps.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template.dart';

class CardTemplate1 extends CardTemplate {
  const CardTemplate1(
    super.personDetails, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 400,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey[800]!, blurRadius: 12, spreadRadius: 1)
        ],
        color: Colors.indigo[100],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.indigo,
                child: const Center(
                  child: Icon(
                    Icons.grass_rounded,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    personDetails.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  gapH4,
                  Text(personDetails.jobTitle),
                  gapH24,
                  if (personDetails.mobileNumber != null) ...[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.phone),
                        gapW12,
                        Text(personDetails.mobileNumber!),
                      ],
                    ),
                    gapH4,
                  ],
                  if (personDetails.email != null) ...[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.email),
                        gapW12,
                        Text(personDetails.email!),
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
