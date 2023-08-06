import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mi_card/src/constants/gaps.dart';
import 'package:mi_card/src/features/card_design/presentation/card_design_screen/card_design_screen_controller.dart';
import 'package:mi_card/src/features/user_cards/models/person_details.dart';

/// In this step, user fills personal details
class CardDesignStep1 extends ConsumerStatefulWidget {
  const CardDesignStep1({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CardDesignStep1State();
}

class _CardDesignStep1State extends ConsumerState<CardDesignStep1> {
  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(cardDesignScreenControllerProvider.notifier).setPersonalDetails(
          PersonDetails(
              name: _nameController.text,
              jobTitle: _jobTitleController.text,
              company: _companyController.text,
              mobileNumber: _mobileController.text,
              email: _emailController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: _nameController,
              ),
              gapH8,

              // Company
              TextFormField(
                decoration: const InputDecoration(labelText: 'Company'),
                controller: _companyController,
              ),
              gapH8,

              // Job Title
              TextFormField(
                decoration: const InputDecoration(labelText: 'Job Title'),
                controller: _jobTitleController,
              ),
              gapH8,

              // Mobile
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mobile'),
                controller: _mobileController,
              ),
              gapH8,

              // Email
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                controller: _emailController,
              ),
              gapH16,

              // Next button
              ElevatedButton(onPressed: _submit, child: const Text('Next')),
            ],
          ),
        ));
  }
}
