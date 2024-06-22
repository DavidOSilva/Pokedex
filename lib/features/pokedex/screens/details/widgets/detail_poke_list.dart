import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailPokeList extends StatelessWidget {
  const DetailPokeList({super.key, required this.pokemon, required this.pokemons});
  final Pokemon pokemon;
  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 83,
      left: 0,
      right: 0,
      height: 200,
      child: Container(
        color: pokemon.corBase,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 24,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(pokemon.nome),
                  Text('#${pokemon.num}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}