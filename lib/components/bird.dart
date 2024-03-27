import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/animation.dart';
import 'package:mini_games/game/assets.dart';
import 'package:mini_games/game/bird_movement.dart';
import 'package:mini_games/game/configuration.dart';
import 'package:mini_games/game/flappy_bird_game.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame>,CollisionCallbacks{

  @override
  Future<void> onLoad() async{
   final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
   final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
   final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);

   size = Vector2(50, 40);
   position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
   current = BirdMovement.middle;
   sprites={
     BirdMovement.middle: birdMidFlap,
     BirdMovement.up: birdUpFlap,
     BirdMovement.down: birdDownFlap,
   };

   add(CircleComponent());

  }

  void fly(){
    add(
      MoveByEffect(Vector2(0,Config.gravity),
          EffectController(duration: 0.2,curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down,
      )
    );
    current = BirdMovement.up;
  }


  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      ) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void gameOver(){
    gameRef.pauseEngine();

  }

  @override
  void update(double dt){
    super.update(dt);
    position.y += Config.birdVelocity * dt;
  }

}