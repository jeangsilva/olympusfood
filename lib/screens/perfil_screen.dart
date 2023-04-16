import 'package:olympusfood/screens/navigation.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _perfilScreenState createState() => _perfilScreenState();
}

class _perfilScreenState extends State<PerfilScreen> {
  bool _editando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navigation(),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF49B417),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.w3schools.com/howto/img_avatar.png'),
                    radius: 50,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Maria Clara Campos',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Nº DE MATRÍCULA 2023022897',
                    style: TextStyle(
                      color: Color.fromARGB(255, 199, 194, 194),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _editando = !_editando;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF49B417),
                          onPrimary: Colors.white,
                          side: BorderSide(width: 1, color: Colors.black),
                        ),
                        child:
                            Text(_editando ? 'Salvar Dados' : 'Editar Dados'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
