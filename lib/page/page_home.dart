import 'package:flutter/material.dart';
import 'package:flutter_clicker/constants.dart';
import 'package:flutter_clicker/state/state_game.dart';
import 'package:flutter_clicker/widget/widget_appbartitle.dart';
import 'package:flutter_clicker/widget/widget_ressource.dart';
import 'package:provider/provider.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const WidgetAppBarTitle(title: pageTitleHome)),
        body:
            GridView.count(crossAxisCount: gridColumnsHome, children: <Widget>[
          for (var item in Provider.of<StateGame>(context).playerRessources)
            WidgetRessource(ressource: item)
        ]));
  }
}
