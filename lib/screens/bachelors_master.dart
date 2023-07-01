import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/screens/bachelor_details.dart';

class BachelorsMaster extends StatelessWidget {
  final List<Bachelor> bachelors =
      generateBachelors(); // Génère une liste de Bachelors fictifs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Bachelors'),
      ),
      body: ListView.builder(
        itemCount: bachelors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BachelorDetails(bachelor: bachelors[index]),
                ),
              );
            },
            child: ListTile(
              // Chargement et affichage des avatars
              leading: ClipOval(
                child: CircleAvatar(
                  backgroundImage: AssetImage(bachelors[index].avatar),
                  radius: 30,
                ),
              ),
              title: Text(bachelors[index].firstname),
            ),
          );
        },
      ),
    );
  }
}

List<Bachelor> generateBachelors() {
  List<Bachelor> bachelors = [];

  List<String> maleFirstNames = [
    'Adam',
    'Noé',
    'Ben',
    'Maher',
    'Aaron',
    'Acher',
    'Caleb',
    'David',
    'Ezra',
    'Isaac',
    'Jacob',
    'Noah',
    'Raphaël',
    'Ilan',
    'Dan',
  ];

  List<String> femaleFirstNames = [
    'Asmaa',
    'Joumana',
    'Eliana',
    'Sophia',
    'Maria',
    'Emma',
    'Anna',
    'Mia',
    'Léa',
    'Myriam',
    'Rebecca',
    'Sarah',
    'Tamar',
    'Zaheva',
    'Maria',
  ];

  List<String> lastNames = [
    'Dupont',
    'Martin',
    'Lefebvre',
    'Durand',
    'Moreau',
    'Dubois',
    'Simon',
    'Laurent',
    'Michel',
    'Rousseau',
    'Leroy',
    'Fournier',
    'Girard',
    'Bonnet',
    'Mercier',
  ];

  List<String> jobs = [
    'Ingénieur logiciel',
    'Designer graphique',
  ];

  // Génération des Bachelors fictifs
  for (int i = 0; i < 15; i++) {
    String firstname;
    String avatar;
    String lastname;
    String job;
    String description;

    if (i % 2 == 0) {
      // Génère un prénom masculin et un avatar d'homme
      firstname = maleFirstNames[i ~/ 2];
      avatar =
          'assets/images/man-${i ~/ 2 + 1}.png'; // utilisé pour générer le chemin relatif de l'avatar
    } else {
      // Génère un prénom féminin et un avatar de femme
      firstname = femaleFirstNames[(i - 1) ~/ 2];
      avatar = 'assets/images/woman-${(i - 1) ~/ 2 + 1}.png';
    }

    lastname = lastNames[i % lastNames.length];
    job = jobs[i % jobs.length];

    if (job == 'Ingénieur logiciel') {
      if (i % 2 == 0) {
        description = 'Passionné de technologie et de programmation.';
      } else {
        description = 'Passionnée de technologie et de programmation.';
      }
    } else if (job == 'Designer graphique') {
      if (i % 2 == 0) {
        description = 'Créatif et passionné par le design visuel.';
      } else {
        description = 'Créative et passionnée par le design visuel.';
      }
    } else {
      description = '';
    }

    Gender gender = i % 2 == 0 ? Gender.Male : Gender.Female;
    List<Gender> searchFor =
        gender == Gender.Male ? [Gender.Female] : [Gender.Male];

    Bachelor bachelor = Bachelor(
      firstname: firstname,
      lastname: lastname,
      gender: gender,
      avatar: avatar,
      searchFor: searchFor,
      job: job,
      description: description,
    );

    bachelors.add(bachelor);
  }

  return bachelors;
}
