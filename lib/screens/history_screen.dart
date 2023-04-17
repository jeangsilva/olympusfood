
            // // Container verde no topo da tela
            // Container(
            //   height: 40,
            //   color: Color(0xFF49B417),
            // ),
            // // Linha com o botão de voltar e o nome "Histórico"
            // Row(
            //   children: [
                // IconButton(
                //   icon: const Icon(Icons.arrow_back),
                //   onPressed: () => Navigator.of(context).pop(),
                // ),
            //     // Nome "Histórico"
            //     const Text(
            //       'Histórico',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //   ],
            // ),


import 'package:flutter/material.dart';
import 'package:olympusfood/screens/navigation.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navigation(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, //para tirar a seta do appBar
        backgroundColor: const Color(0xFF49B417),
        elevation: 0,
        title: const SizedBox.shrink(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //icone de voltar
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text(
                  'Histórico',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 40,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(
                  text: 'Dia',
                ),
                Tab(
                  text: 'Semana',
                ),
                Tab(
                  text: 'Mês',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildHistorico(),
                _buildHistorico(),
                _buildHistorico(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistorico() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '01/04/2023',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Pedido #${index + 1}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'R\$ ${(index + 1) * 10}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}