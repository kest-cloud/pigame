import 'package:flame/game.dart';
import 'package:pigamebykest/background.dart';
import 'package:pigamebykest/next_pie_value.dart';
import 'package:pigamebykest/pie.dart';
import 'package:pigamebykest/plate.dart';
import 'package:pigamebykest/score.dart';

class PiInTheSkyGame extends FlameGame
    with HasDraggables, HasCollisionDetection {
  PiInTheSkyGame();

  late Score score;
  late NextPieValue nextPieValue;

  @override
  Future<void> onLoad() async {
    addAll([
      Backgroud(),
      score = Score(),
      nextPieValue = NextPieValue(),
      for (int i = 0; i <= 10; i++)
        Pie(score: score, nextPieValue: nextPieValue),
      Plate(),
    ]);
  }
}
