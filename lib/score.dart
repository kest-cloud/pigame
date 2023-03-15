import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pigamebykest/pi_in_the_sky.dart';
import 'dart:math' as math;

class Score extends TextComponent with HasGameRef<PiInTheSkyGame> {
  Score();

  late int score;

  @override
  Future<void>? onLoad() async {
    score = 0;
    position = Vector2.all(20);
    text = math.pi.toString();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    text = math.pi.toString().substring(0, 2 + score);
  }

  @override
  void render(Canvas canvas) {
    TextPaint(
        style: const TextStyle(
      fontSize: 40,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    )).render(canvas, text, Vector2.zero());
  }
}
