import 'dart:io';

import 'package:codigo6_books/pages/hive_page.dart';
import 'package:codigo6_books/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();

  print(directory.path);
  Hive.init(directory.path);
  // await Hive.deleteBoxFromDisk('shopping_box');
  await Hive.openBox('books_box');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BookApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.workSansTextTheme(),
      ),
      home: HivePage(),
    );
  }
}
