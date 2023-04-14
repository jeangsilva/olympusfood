import 'package:olympusfood/screens/navigation.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navigation(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container verde no topo da tela
            Container(
              height: 40,
              color: Colors.green,
            ),
            // Linha com o botão de voltar e o nome "Histórico"
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                // Nome "Histórico"
                const Text(
                  'Histórico',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 23), // Espaçamento de 23 pixels
            // Nome "Últimos pedidos"
            const Text(
              'Últimos pedidos',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10), // Espaçamento de 10 pixels
            // Texto "Ver todos os pedidos" alinhado à direita
            const Align(
              alignment: Alignment.topRight,
              child: Text(
                'Ver todos os pedidos',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30), // Espaçamento de 30 pixels
            // Grid com os cards dos lanches
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  _buildCard('Salada',
                      'https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg'),
                  _buildCard('Sandwich',
                      'https://cdn.pixabay.com/photo/2020/06/06/05/31/juicy-sandwich-5265292_960_720.jpg'),
                  _buildCard('Suco',
                      'https://cdn.pixabay.com/photo/2017/01/20/14/59/orange-1995044_960_720.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir os cards dos lanches
  Widget _buildCard(String title, String imageUrl) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8), // Espaçamento de 8 pixels
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8), // Espaçamento de 8 pixels
        ],
      ),
    );
  }
}
