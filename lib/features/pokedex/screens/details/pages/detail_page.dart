import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/widgets/detailAppBar.dart';
import 'package:pokedex/features/pokedex/screens/details/widgets/detailPokeList.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.pokemon, required this.pokemons, required this.onBack, required this.controller, required this.onChangePokemon});
  final Pokemon pokemon;
  final List<Pokemon> pokemons;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;
  bool isOnTop = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification){
          setState(() {
            if(scrollController.position.pixels > 38){
              isOnTop = false;
            }
            else if(scrollController.position.pixels <= 20){
              isOnTop = true;
            }
          });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          slivers: [
        
            //Appbar.
            DetailAppBar(
              pokemon: widget.pokemon,
              onBack: widget.onBack,
              isOnTop: isOnTop,
            ),
        
            //PokeList c/ cabeçalho.
            DetailPokelist(
              pokemon: widget.pokemon,
              pokemons: widget.pokemons,
              controller: widget.controller,
              onChangePokemon: widget.onChangePokemon,
            ),
        
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      color: widget.pokemon.corBase.withOpacity(0.8),
                    ),

                    //Informações do Pokémon com a menuTab.
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}