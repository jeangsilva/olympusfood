import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      shape: CircularNotchedRectangle(),
      color: Color(0xFF49B417),
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () => Null,
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              color: Colors.white),
          IconButton(
              onPressed: () => Null,
              icon: Icon(
                Icons.list_alt,
                size: 30,
              ),
              color: Colors.white),
          IconButton(
              onPressed: () => null,
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              color: Colors.white),
          IconButton(
              onPressed: () => null,
              icon: Icon(
                Icons.person_outline,
                size: 30,
              ),
              color: Colors.white),
        ],
      ),
    );
  }
}
