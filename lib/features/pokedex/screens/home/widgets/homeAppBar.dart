import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 123,
      // color: Color.fromARGB(255, 255, 234, 148),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
    
          //Linha dos botões.
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
              top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: (){},
                  color: Colors.black,
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
          ),
    
          //Linha do titulo.
          const Padding(
            padding: EdgeInsets.only(
              left: 24,
              bottom: 24,
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Pokédex",
                  style: TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}