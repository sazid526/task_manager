import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      bottomNavigationBar: BottomNavigationBar(items:const [
        BottomNavigationBarItem(icon: Icon(Icons.add),label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.add),label: "In Progress"),
        BottomNavigationBarItem(icon: Icon(Icons.add),label: "Completed"),
        BottomNavigationBarItem(icon: Icon(Icons.add),label: "Canceled"),
      ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index){
        _selectedIndex = index;
        setState(() {

        });
        },
      ),
      body:const Center(child: Text("Main Screen"),),
    );
  }
}
