import 'package:flutter/material.dart';
import 'package:task_manager/presentation/UI/Screens/splash_screen.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
       inputDecorationTheme: const InputDecorationTheme(
         fillColor: Colors.white,
         filled: true,
         border: OutlineInputBorder(borderSide: BorderSide.none),
         focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
       ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 32,
        ),
        )
      ),
    );
  }
}
