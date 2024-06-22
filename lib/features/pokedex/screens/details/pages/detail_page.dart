import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/widgets/detail_app_bar.dart';
import 'package:pokedex/features/pokedex/screens/details/widgets/detail_poke_list.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.pokemon, required this.pokemons, required this.onBack});
  final Pokemon pokemon;
  final List<Pokemon> pokemons;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //Appbar.
          DetailAppBar(
            pokemon: pokemon,
            onBack: onBack
          ),

          //Lista Horizontal.
          DetailPokeList(pokemon: pokemon, pokemons: pokemons),
          
        ],
      ),
    );
  }
}