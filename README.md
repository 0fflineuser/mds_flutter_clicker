# Setup
## Installation
Ce projet utilise [fvm](https://fvm.app/).

fvm permet de gérer les versions de flutter par projects et est supporté dans [l'extension vscode](https://fvm.app/docs/getting_started/configuration/#vs-code), [android studio](https://fvm.app/docs/getting_started/configuration/#android-studio) et [neovim](https://github.com/akinsho/flutter-tools.nvim).

```
# switch sur la version du projet utilisée
fvm flavor dev
# installer les paquets
fvm flutter pub get
```

## Lancer le project
Utiliser l'extension de votre IDE ou manuellement : 

- Lister les devices avec `fvm flutter devices`

- Démarrer le project sur avec `fvm flutter run -d <device_name>`
# Références/Ressources
Les ressources utilisées pour ce projet on été :

- Principalement [documentation officielle](https://api.flutter.dev/index.html) de flutter, principalement pour comprendre ou me remémorer comment marchent certains widgets.

- [Youtube](https://www.youtube.com/) pour des vidéos explicatives de certains widgets.

# Difficultés
La plus grande difficultée a été le design de l'application.

# Choix de design/Implémentation

Le dossier `lib/classes` contient les classes utilisées dans le jeu (inventaire, produit, recette, ressource, etc...).

Le dossier `lib/page` contient les pages du jeu (accueil, inventaire, recettes).

La classe StateGame dans `lib/state/state_game` contient les ressources, les recettes et l'inventaire du joueur, les méthodes pour produire une recette, miner une ressource et en débloquer une ainsi que les méthodes pour trier l'inventaire.

Le dossier `lib/widget` va contenir les widgets d'interface qui vont représenter les produits, recettes et ressources.
