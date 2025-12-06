import 'package:Ecommerce/core/route/app_routes.dart';
import 'package:Ecommerce/core/route/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ThemeData.dark(),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: AppRoutes.authPage,
    );
  }
}
