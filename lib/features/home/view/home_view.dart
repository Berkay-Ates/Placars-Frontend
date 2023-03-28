import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const data =
        "Neredeyse %60 ını bugun yaparak tamamladıgımız design kisminda yeni tasarımlara ihtiyacımız bulunmakta. Ayrıca Backend kısmını tuna şen ile beraber host ettirmeyi başardıgımızı soyleyebiliriz";
    return const Scaffold(
      body: Center(
        child: Text(data),
      ),
    );
  }
}
