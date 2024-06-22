import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key, required this.pokemon, required this.onBack});
  final Pokemon pokemon;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 0,
        backgroundColor: pokemon.corBase,
        leading: IconButton(
          onPressed: onBack,
          icon: Padding(
            padding: const EdgeInsets.only(
              left: 8
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              ),
            ),
          ),
      ),
    );
  }
}