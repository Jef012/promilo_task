import 'package:flutter/material.dart';
import 'package:promilo_task/utils/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,

      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

