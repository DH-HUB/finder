import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';

class BachelorDetails extends StatelessWidget {
  final Bachelor bachelor;

  BachelorDetails({required this.bachelor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Bachelor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Affichage de l'avatar
            ClipOval(
              child: CircleAvatar(
                backgroundImage: AssetImage(bachelor.avatar),
                radius: 80,
              ),
            ),
            SizedBox(height: 20),
            // Affichage du nom complet
            Text(
              '${bachelor.firstname} ${bachelor.lastname}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Affichage du job
            Text(
              'Job: ${bachelor.job}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            // Affichage de la description
            Text(
              'Description: ${bachelor.description}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
