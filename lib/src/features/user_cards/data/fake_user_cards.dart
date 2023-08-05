import 'package:mi_card/src/features/user_cards/models/person_details.dart';
import 'package:mi_card/src/features/user_cards/models/user_card.dart';

final List<UserCard> fakeUserCards = [
  UserCard(
      id: '1',
      templateId: 'template_1',
      data: PersonDetails(
          name: 'Adnan Sawas',
          jobTitle: 'Mobile Developer',
          company: 'Aramco',
          mobileNumber: '+966568208802',
          email: 'adnsawas@gmail.com')),
  UserCard(
      id: '2',
      templateId: 'template_2',
      data: PersonDetails(
        name: 'Adnan Sawas',
        jobTitle: 'Mobile Developer',
        company: 'Aramco',
        mobileNumber: '+966568208802',
        email: 'adnsawas@gmail.com',
      )),
  UserCard(
      id: '3',
      templateId: 'template_1',
      data: PersonDetails(name: 'Fahd Islam', jobTitle: 'Accountant')),
];
