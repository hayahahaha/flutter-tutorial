import 'package:flutter/material.dart';
import 'screens/class.dart';
import 'screens/profile.dart';
import 'screens/appraisal.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: ClassPage(),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: Appraisal(),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Profile(),
        ),
      ][_selectedIndex],
      // floatingActionButton: const FloatingActionButton(
      //   tooltip: 'Add', // used by assistive technologies
      //   onPressed: null,
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Class',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Appraisal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
