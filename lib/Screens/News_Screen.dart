import 'package:flutter/material.dart';
import 'package:wootter_news/Screens/News_Body.dart';
import 'package:wootter_news/color.dart';

class NewsScreen extends StatefulWidget {
  
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _selectedIndex = 0;
  int index = 0;
    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          brightness: Brightness.light,
          title: Center(
              child: Text(
            'ALL News',
            textAlign: TextAlign.center,
          )),
          titleTextStyle: TextStyle(color: Colors.white),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.menu,
                    size: 26.0,
                  ),
                ))
          ]),
      body: NewsBody(),
      bottomNavigationBar: _bottomNavigation(),
    );
  }


Widget _bottomNavigation() {
  return BottomNavigationBar(items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.article, color: Colors.grey),
      label: 'All News',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.thumb_up_alt, color: Colors.grey),
      label: 'My Topics',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.timeline, color: Colors.grey),
      label: 'Community',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.check_box_outline_blank, color: Colors.grey),
      label: 'Saved Items',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notification_important, color: Colors.grey),
      label: 'Notifications',
    )
  ],
   currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
  
  );
}
}