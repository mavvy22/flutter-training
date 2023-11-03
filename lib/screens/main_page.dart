import 'package:flutter/material.dart';
import 'package:tasknaut_mobile/components/create_project_form.dart';
import 'package:tasknaut_mobile/screens/create_task_page.dart';
import 'package:tasknaut_mobile/screens/profile_page.dart';
import 'package:tasknaut_mobile/screens/projects_page.dart';
import 'package:tasknaut_mobile/screens/tasks_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const routeName = '/main';

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  static const List<Widget> _pages = <Widget>[
    ProjectsPage(),
    TasksPage(),
    ProfilePage()
  ];

  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _createIconColor(index) {
    if (index == _selectedIndex && index == 0) {
      return const Color.fromARGB(255, 20, 83, 255);
    }
    if (index == _selectedIndex && index == 1) {
      return Colors.pink;
    }
    if (index == _selectedIndex && index == 2) {
      return Colors.deepOrangeAccent;
    }
    return Colors.white70;
  }

  Widget? _createFab(BuildContext context) {
    if (_selectedIndex == 2) {
      return null;
    }
    if (_selectedIndex == 1) {
      return FloatingActionButton.extended(
        backgroundColor: Colors.pink,
        onPressed: () {
          Navigator.pushNamed(context, CreateTaskPage.routeName);
        },
        label: const Text('Task', style: TextStyle(color: Colors.white)),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      );
    }
    return FloatingActionButton.extended(
      backgroundColor: const Color.fromARGB(255, 20, 83, 255),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return Dialog(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(children: [
                      Text(
                        'Create Project',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ]),
                    CreateProjectForm(ctx: ctx)
                  ],
                ),
              ));
            });
      },
      label: const Text('Project', style: TextStyle(color: Colors.white)),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: _createFab(context),
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          indicatorColor: const Color.fromARGB(255, 219, 219, 219),
          // unselectedItemColor: Theme.of(context).cardColor,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onTap,
          destinations: <Widget>[
            NavigationDestination(
              icon: Icon(Icons.folder, color: _createIconColor(0)),
              label: 'Projects',
            ),
            NavigationDestination(
                icon: Icon(
                  Icons.web_stories,
                  color: _createIconColor(1),
                ),
                label: 'Tasks'),
            NavigationDestination(
                icon: Icon(
                  Icons.account_circle,
                  color: _createIconColor(2),
                ),
                label: 'Profile')
          ],
        ));
  }
}
