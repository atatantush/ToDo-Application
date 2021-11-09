import 'package:flutter/material.dart';
import 'package:to_do_application/AddToDoWidget.dart';
import 'package:to_do_application/list_todo_tab.dart';
import 'package:to_do_application/settings_todo_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 5)),
        child: Icon(Icons.add),
        onPressed: () {
          ShowToDoSheet(); /////////////////////////////////////////////// function missed!!!
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (Index) {
            currentIndex = Index;
            setState(() {});
          },
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [
    ListToDoTab(),
    SettingsToDoTab(),
  ];

  void ShowToDoSheet() {
    showModalBottomSheet(
      context: context,
      builder: (buildContext) {
        return AddToDoWidget();
      },
    );
  }
}
