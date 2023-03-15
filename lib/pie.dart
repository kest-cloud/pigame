import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:pigamebykest/next_pie_value.dart';
import 'package:pigamebykest/pi_in_the_sky.dart';
import 'package:pigamebykest/plate.dart';
import 'package:pigamebykest/score.dart';

class Pie extends SpriteComponent
    with HasGameRef<PiInTheSkyGame>, CollisionCallbacks {
  late final Score _score;
  late final NextPieValue _nextPieValue;
  Pie({required Score score, required NextPieValue nextPieValue})
      : _score = score,
        _nextPieValue = nextPieValue;

  final Random _random = Random();
  late int pieNumber;
  late Image image;
  late double velocity = 150;

  List _colors = ['Blue', 'Orange', 'Pink', 'Yellow'];

  @override
  Future<void> onLoad() async {
    resetPie();
    final image = await Flame.images.load('Pies/Pie_Blue-03.png');
    size = Vector2(70, 70);
    sprite = Sprite(image);
    add(CircleHitbox(radius: 35));
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += velocity * dt;
    if (position.y >= gameRef.size.y + size.y) {
      resetPie();
    }
  }

  resetPie() async {
    position.x = _random.nextDouble() * gameRef.size.x - size.x;
    position.y = _random.nextDouble() * -500;
    velocity = 150 + _random.nextDouble() * 250;

    pieNumber = _random.nextInt(10);
    String color = _colors[_random.nextInt(4)];
    image = await Flame.images.load('Pies/Pie_$color-0$pieNumber.png');
    sprite = Sprite(image);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Plate) {
      if (_nextPieValue.nextValue == pieNumber) {
        _score.score += 1;
        _nextPieValue.score += 1;
        resetPie();
      } else {
        gameRef.pauseEngine();
      }
      print('Collided!!!');
    }
  }
}
