import 'package:flutter/material.dart';
import 'package:flutter_clicker/classes/ressource.dart';
import 'package:flutter_clicker/state/state_game.dart';
import 'package:provider/provider.dart';

class WidgetRessource extends StatefulWidget {
  final Ressource ressource;

  const WidgetRessource({super.key, required this.ressource});

  @override
  State<WidgetRessource> createState() => _WidgetRessourceState();
}

class _WidgetRessourceState extends State<WidgetRessource> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var stateGame = Provider.of<StateGame>(context);

    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white, fontSize: 22),
      child: Container(
        decoration: BoxDecoration(
            color: widget.ressource.color,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.ressource.name),
            Text("Quantitée : ${widget.ressource.quantity}"),
            widget.ressource.isLocked
                ? const Text("Désactivée")
                : ElevatedButton(
                    style: const ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.blue)),
                    onPressed: () {
                      stateGame.mineRessource(widget.ressource);
                    },
                    child: const Text("Miner"))
          ],
        )),
      ),
    );
  }
}
