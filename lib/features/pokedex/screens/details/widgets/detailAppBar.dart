import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key, required this.pokemon, required this.onBack, required this.isOnTop});
  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
  return SliverAppBar(
    pinned: true,
    centerTitle: true,
    elevation: 0,
    title: AnimatedOpacity(
      opacity: isOnTop ? 0 : 1,
      duration: Duration(milliseconds: 200),
      child: Text(
        pokemon.nome,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Google',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
    backgroundColor: pokemon.corBase,
    actions: [
      //Botão de favorito.
      Padding(
        padding: const EdgeInsets.only(
          right: 8,
        ),
        child: IconButton(
          // ignore: avoid_print
          onPressed: (){},
          color: const Color.fromARGB(255, 255, 255, 255),
          icon: const Icon(Icons.favorite_outline),
        ),
      ),
    ],
    leading: IconButton(
      onPressed: onBack,
      icon: Padding(
        padding: const EdgeInsets.only(
          left: 8,
        ),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  );
  }
}