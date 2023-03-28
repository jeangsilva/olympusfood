import 'package:page_indicator/page_indicator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkModeEnabled = false;
  bool isAlunoSelected = true;

  final PageController _pageController = PageController();

  final List<String> _images = [
    'https://picsum.photos/200',
    'https://picsum.photos/201',
    'https://picsum.photos/202',
  ];

  final lightTheme = ThemeData(
    primaryColor: Colors.green,
    backgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  final darkTheme = ThemeData(
    primaryColor: Colors.grey[900]!,
    backgroundColor: Colors.grey[800]!,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkModeEnabled ? darkTheme : lightTheme,
      home: Scaffold(
        backgroundColor: isDarkModeEnabled ? Colors.grey[800] : Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://www.w3schools.com/howto/img_avatar.png'),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            SizedBox(height: 16),
                            Text(
                              'Olá, Maria Clara',
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
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAlunoSelected = !isAlunoSelected;
                  });
                },
                child: Container(
                  height: 30,
                  width: 150,
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
                                  ? Colors.green
                                  : Colors.grey[400],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Aluno',
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
                                  ? Colors.grey[400]
                                  : Colors.green,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Responsável',
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
              SizedBox(height: 16),
              Expanded(
                child: Container(
                  height: 100, // altere o valor da altura para o desejado
                  child: PageIndicatorContainer(
                    length: _images.length,
                    align: IndicatorAlign.bottom,
                    indicatorColor: Colors.grey,
                    indicatorSelectorColor: Colors.green,
                    child: PageView(
                      controller: _pageController,
                      children: _images.map((imageUrl) {
                        return Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
