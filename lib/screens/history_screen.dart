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
                  icon: const Icon(Icons.arrow_circle_left_outlined),
                ),
                const Text(
                  'HISTÓRICO',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
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
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                color: const Color(0xFF49B417),
                borderRadius: BorderRadius.circular(8),
              ),
              tabs: [
                const Tab (
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('DIÁRIO',
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                ),
                const Tab(
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('SEMANAL',
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: double.infinity,
                    child: const Center(
                      child: Text('MENSAL',
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildHistoricoDiario(),
                _buildHistoricoSemanal(),
                _buildHistoricoMensal(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoricoDiario() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black, width: 2),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '01/04/2023',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Pedido #${index + 1}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'R\$ ${(index + 1) * 10}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildHistoricoSemanal() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black, width: 2),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '01/04/2023',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Pedido #${index + 1}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'R\$ ${(index + 1) * 10}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildHistoricoMensal() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black, width: 2),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '01/04/2023',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Pedido #${index + 1}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'R\$ ${(index + 1) * 10}',
                style: TextStyle(
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