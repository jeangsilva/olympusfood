import 'package:flutter/material.dart';
import 'package:olympusfood/screens/navigation.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _perfilScreenState createState() => _perfilScreenState();
}

class _perfilScreenState extends State<PerfilScreen> {
  bool _editando = false;
  String _nome = 'Maria Clara Campos';
  int _idade = 10;
  String _serieEscolar = '5º ano';

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
                    _nome,
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
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome Completo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _nome,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        _editando
                            ? IconButton(
                                onPressed: () {
                                  // Adicione aqui a lógica para editar o nome
                                },
                                icon: Icon(Icons.edit),
                                color: Colors.black,
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Idade',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '10 anos',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    _editando
                                        ? IconButton(
                                            onPressed: () {
// Adicione aqui a lógica para editar a idade
                                            },
                                            icon: Icon(Icons.edit),
                                            color: Colors.black,
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Série Escolar',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '5º ano',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    _editando
                                        ? IconButton(
                                            onPressed: () {
// Adicione aqui a lógica para editar a série escolar
                                            },
                                            icon: Icon(Icons.edit),
                                            color: Colors.black,
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
