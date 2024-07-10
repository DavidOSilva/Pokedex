import 'package:flutter/material.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repository/pokeRepository.dart';
import 'package:pokedex/common/widgets/error.dart';
import 'package:pokedex/common/widgets/loading.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments{
  DetailArguments({this.index=0, required this.pokemon});
  final Pokemon pokemon;
  final int? index;
}

class DetailsContainer extends StatefulWidget {
  const DetailsContainer({
    super.key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  });
  final IPokeRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  late PageController _controller;
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;

  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index!,
    );
    _future = widget.repository.obterTodosPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future, //Carrega todos os Pokémons válidos do JSON.
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return LoadingDefault();
        }
        else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          if (_pokemon == null){
            _pokemon = widget.arguments.pokemon;
          }
          return DetailPage(
            pokemon: _pokemon!,
            pokemons: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            onChangePokemon: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
          );
        }
        else if (snapshot.hasError){
          return ErrorDefault(
            error:(snapshot.error as Failure).mensagem!,
          );
        }
        return Placeholder();
      },
    );
  }
}