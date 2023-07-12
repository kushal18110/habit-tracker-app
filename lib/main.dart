import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/habit_model.dart';
import 'package:habit_tracker/pages/habit_provider.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

   Hive.registerAdapter(habitModelAdapter());

  await Hive.openBox('habits');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=> habits(), builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),),);
  }
}