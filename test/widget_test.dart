import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finder/screens/bachelors_master.dart';
import 'package:finder/widgets/bachelor_preview.dart';
import 'package:finder/screens/bachelor_details.dart';

void main() {
  testWidgets('Vérification du rendu de BachelorsMaster',
      (WidgetTester tester) async {
    // Construire un WidgetTester pour tester les widgets
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BachelorsMaster(), // Instanciez le widget à tester
        ),
      ),
    );

    // Vérifiez que le widget BachelorsMaster est bien rendu
    expect(find.byType(BachelorsMaster), findsOneWidget);

    // Vérifiez qu'il y a une ListView qui contient des widgets
    expect(find.byType(ListView), findsOneWidget);
    expect(
        find.byType(BachelorPreview),
        findsNWidgets(
            30)); // Il devrait y avoir 30 BachelorPreview dans la liste

    // Vérifiez que chaque BachelorPreview a un avatar et un texte avec le nom et prénom
    for (var i = 0; i < 30; i++) {
      expect(find.byKey(ValueKey('avatar_$i')),
          findsOneWidget); // Vérifiez l'avatar
      expect(find.text('Adam $i'),
          findsOneWidget); // Vérifiez le texte du nom et prénom
    }

    // Sélectionnez le premier BachelorPreview (index 0) pour vérifier s'il peut naviguer vers les détails
    await tester.tap(find.byKey(ValueKey('bachelor_preview_0')));
    await tester.pumpAndSettle();

    // Vérifiez que l'écran BachelorDetails est bien rendu
    expect(find.byType(BachelorDetails), findsOneWidget);

    // Vérifiez que les informations du premier Bachelor (index 0) sont affichées
    expect(find.text('Adam'), findsOneWidget);
    expect(find.text('Job'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);

    // Vérifiez que les informations du premier Bachelor (index 0) sont affichées
    expect(find.text('Adam'), findsOneWidget);
    expect(find.text('Job'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);

    // Vérifiez que le widget BachelorsMaster est bien rendu
    expect(find.byType(BachelorsMaster), findsOneWidget);
// Vérifiez que le bouton de like est présent
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    // Appuyez sur le bouton de like
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pumpAndSettle();

    // Vérifiez que l'icône de like est maintenant rempli (liké)
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    // Revenez à l'écran BachelorsMaster
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Vérifiez que l'écran BachelorsMaster est à nouveau rendu
    expect(find.byType(BachelorsMaster), findsOneWidget);

    // Vérifiez que le premier BachelorPreview (index 0) a maintenant l'icône de like remplie (liké)
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
