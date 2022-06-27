import 'package:flutter/material.dart';
import 'package:userslist/pages/home_page.dart';
import 'package:userslist/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lista de usuários',
        themeMode: ThemeMode.light,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: HomePage(),
      );
}
