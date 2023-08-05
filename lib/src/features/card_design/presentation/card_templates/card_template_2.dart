import 'package:flutter/material.dart';
import 'package:mi_card/src/constants/gaps.dart';
import 'package:mi_card/src/features/card_design/presentation/card_templates/card_template.dart';

class CardTemplate2 extends CardTemplate {
  const CardTemplate2(super.personDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.grey[800]!, blurRadius: 12, spreadRadius: 1)
          ]),
      child: Stack(
        children: [
          // background image
          Image.asset('assets/card_templates/template2.png'),

          // The card design
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.red, width: 8),
                      color: Colors.red[100]),
                ),
                gapH12,
                Text(
                  personDetails.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                gapH4,
                Text(
                  personDetails.jobTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),

          // Detials in the white section
          Positioned(
            bottom: 150,
            left: 100,
            right: 50,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (personDetails.mobileNumber != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Expanded(flex: 1, child: Text('Mobile')),
                        const Text(':  '),
                        Expanded(
                            flex: 3, child: Text(personDetails.mobileNumber!)),
                      ],
                    ),
                    gapH4,
                  ],
                  if (personDetails.email != null) ...[
                    Row(
                      children: [
                        const Expanded(flex: 1, child: Text('Email')),
                        const Text(':  '),
                        Expanded(flex: 3, child: Text(personDetails.email!)),
                      ],
                    ),
                    gapH4,
                  ],
                  if (personDetails.mobileNumber != null) ...[
                    Row(
                      children: [
                        const Expanded(flex: 1, child: Text('Mobile')),
                        const Text(':  '),
                        Expanded(
                            flex: 3, child: Text(personDetails.mobileNumber!)),
                      ],
                    ),
                    gapH4,
                  ],
                ]),
          ),
        ],
      ),
    );
  }
}
