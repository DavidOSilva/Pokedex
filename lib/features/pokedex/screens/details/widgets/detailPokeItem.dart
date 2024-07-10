import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailPokeItem extends StatelessWidget {
  const DetailPokeItem({super.key, required this.isDiff, required this.pokemon});
  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 200),
          tween: Tween(
            begin: isDiff ? 200 : 80,
            end: isDiff ? 80 : 200,
          ),
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Image.asset(
                pokemon.hire,
                width: value,
                fit: BoxFit.contain,
                color: isDiff
                    ? Colors.black.withOpacity(0.4)
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}