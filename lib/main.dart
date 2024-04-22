// ignore_for_file: use_super_parameters, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:karirku/screens/crud.dart';
import 'package:karirku/screens/joblist_screen.dart';
import 'package:karirku/screens/login.dart';
import 'package:karirku/screens/news_screen.dart';
import 'package:karirku/screens/routes/DatasScreen/datas_screen.dart';
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/job_list': (context) => const JobList(),
        '/second-screen': (context) => const SecondScreen(),
        '/news-screen': (context) => const NewsScreen(),
        '/datas-screen': (context) => const DatasScreen(),
        '/dashboard': (context) => const MyHomePage(title: 'Home Screen')
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

  void navigateAndCloseDrawer(BuildContext context, String routeName) {
    try {
      if (Scaffold.of(context).isDrawerOpen) {
        Navigator.pop(context); // Close the drawer first
      }
      Navigator.pushNamed(context, routeName);
    } catch (error) {
      // Handle navigation errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 61, 131, 188),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: 30.0, // Adjust radius as needed
                      foregroundImage:
                          AssetImage('assets/images/avatar-hd.png'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Kevin Pratama\n2215091009',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('API Screen'),
              selected: _selectedIndex == 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DatasScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Notes'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BooksScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Job List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_sharp),
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
