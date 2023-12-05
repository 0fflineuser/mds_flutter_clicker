import 'package:flutter/material.dart';
import 'package:flutter_clicker/constants.dart';
import 'package:flutter_clicker/state/state_game.dart';
import 'package:flutter_clicker/widget/widget_appbartitle.dart';
import 'package:flutter_clicker/widget/widget_recipe.dart';
import 'package:provider/provider.dart';

class PageRecipes extends StatelessWidget {
  const PageRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const WidgetAppBarTitle(title: pageTitleRecipe)),
        body: ListView(children: <Widget>[
          for (var item in Provider.of<StateGame>(context).playerRecipes)
            WidgetRecipe(recipe: item)
        ]));
  }
}
