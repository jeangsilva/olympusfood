import 'package:flutter/material.dart';
import 'package:olympusfood/screens/navigation.dart';

class CarteiraScreen extends StatefulWidget {
  const CarteiraScreen({super.key});

  @override
  State<CarteiraScreen> createState() => _CarteiraScreenState();
}

class _CarteiraScreenState extends State<CarteiraScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigation(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 200,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 73, 180, 23),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}