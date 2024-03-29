import 'package:olympusfood/screens/navigation.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:flutter/material.dart';
import 'carteira_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState(); //tornei pública para tirar o erro.
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkModeEnabled = false;
  bool isAlunoSelected = true;
  bool _showText = false;

  final PageController _pageController = PageController();

  final List<String> _images = [
    'https://picsum.photos/200',
    'https://picsum.photos/201',
    'https://picsum.photos/202',
  ];

  final lightTheme = ThemeData(
    primaryColor: const Color(0xFF49B417),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
    background: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  final darkTheme = ThemeData(
  primaryColor: Colors.grey[900]!,
  scaffoldBackgroundColor: Colors.grey[800]!,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
    ),
  ),
);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkModeEnabled ? darkTheme : lightTheme,
      home: Scaffold(
        bottomNavigationBar: const Navigation(),
        backgroundColor: isDarkModeEnabled ? Colors.grey[800] : Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 73, 180, 23),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Column(
                          children: const [
                            SizedBox(height: 30),
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  'https://www.w3schools.com/howto/img_avatar.png'),
                            ),
                            SizedBox(height: 25),
                            Text(
                              'Olá, Maria Clara!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        //const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Nº da matrícula',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '123456',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isDarkModeEnabled = !isDarkModeEnabled;
                            });
                          },
                          icon: Icon(
                            isDarkModeEnabled
                                ? Icons.nightlight_round
                                : Icons.wb_sunny,
                            color:
                                isDarkModeEnabled ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAlunoSelected = !isAlunoSelected;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 55, vertical: 10),
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isAlunoSelected = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isAlunoSelected
                                    ? const Color(0xFF49B417)
                                    : Colors.grey[400],
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'ESTUDANTE',
                                  style: TextStyle(
                                    color: isAlunoSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isAlunoSelected = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isAlunoSelected
                                    ? const Color.fromRGBO(156, 156, 156, 1)
                                    : const Color(0xFF49B417),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'RESPONSÁVEL',
                                  style: TextStyle(
                                    color: isAlunoSelected
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Área da propaganda
                const SizedBox(height: 16),
                Container(
                  height: 150, // altere o valor da altura para o desejado
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: PageIndicatorContainer(
                    length: _images.length,
                    align: IndicatorAlign.bottom,
                    indicatorColor: Colors.grey,
                    indicatorSelectorColor: const Color(0xFF49B417),
                    child: PageView(
                      controller: _pageController,
                      children: _images.map((imageUrl) {
                        return SizedBox(
                          width: double.infinity,
                          height:
                              100, // altere o valor da altura para o desejado
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                //icones do centro
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: const Color(0xFF49B417),
                                fixedSize: const Size(65, 65)),
                            child:
                                const Icon(Icons.menu_book_outlined, size: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text(
                              "CARDÁPIO",
                              style: TextStyle(
                                  color: isDarkModeEnabled
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HistoryScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: const Color(0xFF49B417),
                                  fixedSize: const Size(65, 65)),
                              child:
                                  const Icon(Icons.history_outlined, size: 30)),
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text(
                              "HISTÓRICO",
                              style: TextStyle(
                                  color: isDarkModeEnabled
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: const Color(0xFF49B417),
                                  fixedSize: const Size(65, 65)),
                              child: const Icon(Icons.favorite_border_outlined,
                                  size: 30)),
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text(
                              "FAVORITOS",
                              style: TextStyle(
                                  color: isDarkModeEnabled
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          )
                        ],
                      )
                    ]),
                //Carteira Digital
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(15),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color.fromARGB(80, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(children: [
                    Row(children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 11),
                        child: Text(
                          "Carteira Digital",
                          style: TextStyle(
                              color: Color(0xFF49B417),
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Saldo Disponível",
                                style: TextStyle(
                                    color: Color(0xFF49B417),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.start,
                              ),
                              Text(_showText ? "R\$ 120,00" : "**********")
                            ],
                          ),
                          //Botão de Visualizar
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _showText = !_showText;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: const Color(0xFF49B417),
                                  fixedSize: const Size(40,
                                      40), // Define um tamanho fixo para o botão
                                ),
                                child: Icon(
                                  _showText
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                ),
                              ),
                            ],
                          ),
                        ]),
                    Row(children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Limite Diário",
                                style: TextStyle(
                                    color: Color(0xFF49B417),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.start,
                              ),
                              Text(_showText ? "R\$ 20,00" : "**********")
                            ],
                          ))
                    ]),
                  ]),
                ),
                const SizedBox(height: 15),
                Padding(padding: const EdgeInsets.all(17),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CarteiraScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 197, 191, 191),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(Icons.wallet,color: Colors.black,),
                                SizedBox(width: 14,),
                                Text(
                                  "Minha Carteira",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0,-8),
                        child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.help,
                          color: Color.fromARGB(255, 197, 191, 191),
                          size: 40,
                        ),
                      ),
                      ),
                      
                    ],
                  ),
                ),
                const SizedBox(height: 30,)
              ]
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

