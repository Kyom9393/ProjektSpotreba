import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SpotrebaAplikace(), // hlavni obrazovka
  ));
}

class SpotrebaAplikace extends StatefulWidget {
  @override
  _SpotrebaAplikaceState createState() => _SpotrebaAplikaceState();
}

class _SpotrebaAplikaceState extends State<SpotrebaAplikace> {
  final TextEditingController tachometrController = TextEditingController();
  final TextEditingController palivoController = TextEditingController();

  double prumernaSpotreba = 0.0; // vysledna prumerna spotreba

  // vypocet PS
  void vypocitatSpotrebu() {
    double tachometr = double.tryParse(tachometrController.text) ?? 0;
    double palivo = double.tryParse(palivoController.text) ?? 0;

    if (tachometr > 0 && palivo > 0) {
      setState(() {
        prumernaSpotreba = (palivo / (tachometr / 100));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Průměrná spotřeba')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tachometrController,
              keyboardType: TextInputType.number, // klavesnice - cisla
              decoration: InputDecoration(labelText: 'Stav tachometru (km)'),
            ),
            TextField(
              controller: palivoController, // Pro vstup množství paliva
              keyboardType: TextInputType.number, // Klávesnice pro čísla
              decoration: InputDecoration(labelText: 'Množství paliva (litry)'),
            ),
            ElevatedButton(
              onPressed: vypocitatSpotrebu, // Akce po stisknutí tlačítka
              child: Text('Vypočítat'), // Text na tlačítku
            ),
            Text('Průměrná spotřeba: ${prumernaSpotreba.toStringAsFixed(2)} l/100 km'), // Zobrazení výsledku
          ],
        ),
      ),
    );
  }
}
