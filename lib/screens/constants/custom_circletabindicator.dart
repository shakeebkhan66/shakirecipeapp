import 'package:flutter/cupertino.dart';

class CircleTabIndicator extends Decoration {

  Color? color;
  double? radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]){
    return CirclePainter(color:color, radius:radius);
  }
}

class CirclePainter extends BoxPainter{
  Color? color;
  double? radius;

  CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint paint;
    paint = Paint()..color = color!;
    paint = paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2,
            cfg.size!.height - radius!);
    canvas.drawCircle(circleOffset, radius!, paint);
  }
}