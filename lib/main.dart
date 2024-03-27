import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mini_games/game/flappy_bird_game.dart';
import 'customCard.dart';
import 'rolldie.dart';
import 'coinFlip.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{

  final game =FlappyBirdGame();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Mini Games',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomCard(imgPath: 'assets/coin.png', titleText: 'Toss a coin',gameScreen: FlipCoin(),),
              const SizedBox(height: 10,),
              CustomCard(imgPath: 'assets/dice.png', titleText: 'Roll a die',gameScreen: RollDie(),),
              const SizedBox(height: 10,),
              CustomCard(imgPath: 'assets/flappy.png', titleText: 'Flappy Bird',gameScreen: GameWidget(game: game,),),
            ],
          ),
        ),
      ),
    );
  }

}
