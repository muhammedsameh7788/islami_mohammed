import 'package:flutter/material.dart';
import 'package:islami_hamo/ui/hadeath/hadeath.dart';
import 'package:islami_hamo/ui/qoraan/qoraan_tab.dart';
import 'package:islami_hamo/ui/radio/radio.dart';
import 'package:islami_hamo/ui/sebha/sebhaa.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/images/backgroundemage.png',
        ),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'اسلامي',
            style: TextStyle(color: Colors.black),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTapIndex,
          onTap: (index) {
            setState(() {
              selectedTapIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/moshaf_blue.png')),
                label: 'القرءان'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/Group 6.png')),
                label: 'احاديث'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                label: 'سبحه'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/radio_blue.png')),
                label: 'راديو'),
          ],
        ),
        body: tabs[selectedTapIndex],
      ),
    );
  }

  List<Widget> tabs = [QoraanTab(), HadeathTab(), SebhaaTab(), RadioTab()];
}
