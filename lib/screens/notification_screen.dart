import 'package:flutter/material.dart';
import 'package:olympusfood/screens/navigation.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navigation(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 70, // Aumentando a altura para dar espaço ao texto
            width: double.infinity,
            color: const Color(0xFF49B417),
            padding: const EdgeInsets.symmetric(
                horizontal:
                    16), // Adicionando padding para afastar o ícone e o texto da borda do container
            child: Row(
              children: [
                SizedBox(
                  // Adicionando um SizedBox para afastar o ícone da borda do container
                  height: 24,
                  width: 24,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                    width:
                        16), // Adicionando um SizedBox para afastar o texto do ícone
                Expanded(
                  // Utilizando o Expanded para permitir que o texto ocupe todo o espaço disponível
                  child: Text(
                    'Notificações',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return NotificationTile(
                  title: 'Seja bem-vindo ao Olympus Food',
                  subtitle: 'Lorem ipsum dolor sit amet',
                  date: '17 de Abril de 2023',
                  time: '8 horas atrás',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String time;

  NotificationTile({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(subtitle),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date),
              Text(time),
            ],
          ),
        ],
      ),
    );
  }
}
