import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';

//représente une seule instance de Bachelor dans la liste. Il utilise un ListTile pour afficher l'aperçu avec l'avatar
//du bachelor et son nom complet. Lorsque l'utilisateur appuie sur l'aperçu, il est redirigé vers l'écran de détails
// (/details) en passant l'objet bachelor en tant qu'argument.
class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;

  const BachelorPreview({required this.bachelor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: CircleAvatar(
          backgroundImage: AssetImage(bachelor.avatar),
          radius: 40,
        ),
      ),
      title: Text('${bachelor.firstname} ${bachelor.lastname}'),
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: bachelor);
      },
    );
  }
}
