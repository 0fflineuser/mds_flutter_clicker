import 'package:flutter/material.dart';
import 'package:flutter_clicker/page/page_home.dart';
import 'package:flutter_clicker/state/state_game.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StateGame(),
        child: const MaterialApp(home: PageHome()));
  }
}
