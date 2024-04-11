// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
// import 'package:my_app/screens/example_screen.dart';
import 'package:karirku/screens/joblist_screen.dart';
import 'package:karirku/screens/news_screen.dart';
import 'package:karirku/screens/routes/SecondScreen/second_screen.dart';
import 'package:karirku/screens/community_screen.dart';
import 'package:karirku/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Screen'),
      routes: {
        '/second-screen': (context) => const SecondScreen(),
        '/news-screen':(context) => const NewsScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const JobList(),
    const CommunityPage(),
    const ProfilePage(),
  ];

  final List<String> _appBarTitles = const [
    'Job List',
    'Community',
    'Profile',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Job List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}