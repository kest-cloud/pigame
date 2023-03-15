import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:pigamebykest/pi_in_the_sky.dart';

class Backgroud extends SpriteComponent with HasGameRef<PiInTheSkyGame> {
  Backgroud();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('Sky.png');
    size = gameRef.size;
    sprite = Sprite(image);
  }
}
