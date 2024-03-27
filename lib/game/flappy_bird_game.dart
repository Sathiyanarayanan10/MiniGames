import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:mini_games/components/background.dart';
import 'package:mini_games/components/bird.dart';
import 'package:mini_games/components/ground.dart';
import 'package:mini_games/components/pipe_group.dart';
import 'package:mini_games/game/configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector,HasCollisionDetection{

  late Bird bird;
  Timer interval =Timer(Config.pipeInterval,repeat: true);

  @override
  Future<void> onLoad() async{
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap(){
    super.onTap();
    bird.fly();
  }


  @override
  void update(double dt){
    super.update(dt);
    interval.update(dt);
  }

}