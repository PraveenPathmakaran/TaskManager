import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'const/const.dart';
import 'model/week_model.dart';
import 'view/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(WeekModelAdapter().typeId)) {
    Hive.registerAdapter(WeekModelAdapter());
  }
  await Hive.openBox<WeekModel>(boxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
