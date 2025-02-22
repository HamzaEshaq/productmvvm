import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 23,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.red.shade900,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.red.shade900,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/favorites_view");
              },
              child: Icon(
                Icons.favorite,
                color: Colors.red.shade900,
              ),
            ),
            label: ""),
      ],
    );
  }
}
