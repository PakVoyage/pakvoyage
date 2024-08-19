import 'package:flutter/material.dart';
import 'package:pak_voyage/Screens/City%20Guide/city_guide.dart';
import 'package:pak_voyage/Screens/Home/Ui/home_screen.dart';
import 'package:pak_voyage/Screens/My%20trips/my_trips.dart';
import 'package:pak_voyage/Utils/styled_fonts.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CityGuideView(),
    MyTrips()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: StyledTheme.styledFonts.copyWith(fontSize: 11),
        unselectedLabelStyle: StyledTheme.styledFonts.copyWith(fontSize: 11),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Cities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.train_sharp),
            label: 'My Trips',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
