import 'package:flutter/material.dart';
import 'package:pokedex/common/consts/constPaths.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/widgets/DetailPokeItem.dart';

class DetailPokelist extends StatelessWidget {
  const DetailPokelist({super.key, required this.pokemon, required this.pokemons, required this.controller, required this.onChangePokemon});
  final Pokemon pokemon;
  final List<Pokemon> pokemons;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    final Color corBase = pokemon.corBase;
    final Color corMaisClara = corBase.withOpacity(0.8);
    double screenWidth = MediaQuery.of(context).size.width;
    const double tamanhoDosCirculos = 60;
    const double tamanhoDaPokebola = 250;

    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: pokemon.corBase,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              corBase,
              corMaisClara,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              
                  //Nome do Pokémon.
                  Flexible(
                    child: Text(
                      pokemon.nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
              
                  //Número do Pokémon.
                  Text(
                    '#${pokemon.num}',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            //Tipo do Pokémon.
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pokemon.tipo.map((type) {
                  return Text(
                    type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  );
                }).toList(),
              ),
            ),
      
            //Lista Horizontal das Imagens dos Pokémons.
            Stack(
              children: [

                //Imagem dos circulos brancos.
                Padding(
                  padding: EdgeInsets.only(
                      top: 45,
                      left: screenWidth * 0.2,
                  ),
                  child: Opacity(
                    opacity: 0.15,
                    child: Image.asset(
                      ConstPath.whiteCircles,
                      height: tamanhoDosCirculos,
                      width: tamanhoDosCirculos,
                    ),
                  ),
                ),

                //Imagem da Pokébola.
                SizedBox(
                  height: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      // left: screenWidth - tamanhoDaPokebola * 0.6,
                      top: 250,
                    ),
                    child: OverflowBox(
                      maxHeight: screenWidth,
                      maxWidth: screenWidth,
                      child: Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          ConstPath.whitePokeball,
                          height: tamanhoDaPokebola,
                          width: tamanhoDaPokebola,
                        ),
                      ),
                    ),
                  ),
                ),

                //PokeItem.
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: PageView(
                    onPageChanged: (index) => onChangePokemon(pokemons[index]),
                    controller: controller,
                    children: pokemons.map((e) {
                      bool isDiff = e.nome != pokemon.nome;
                      return DetailPokeItem(
                        isDiff: isDiff,
                        pokemon: e,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConstsApp {
}
