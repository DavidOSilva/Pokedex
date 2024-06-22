import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 100,
      // color: Color.fromARGB(255, 255, 234, 148),
      child: Column(
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
            padding: EdgeInsets.only(left:26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Pokédex",
                  style: TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
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