import 'dart:math';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BizBotPet extends StatefulWidget {
  const BizBotPet({Key key}) : super(key: key);

  @override
  _BizBotPetState createState() => _BizBotPetState();
}

class _BizBotPetState extends State<BizBotPet>
    with SingleTickerProviderStateMixin {
  Offset begin = const Offset(0, 0);
  Offset end = Offset(Random().nextDouble() - 0.5, 0);
  bool isGoingRight;
  AnimationController _controller;
  Animation<Offset> _position;

  Widget get _lookingLeft => Image.asset('assets/images/bizbot.png');

  Widget get _lookingRight => Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: Image.asset('assets/images/bizbot.png'),
      );

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _position = Tween(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.addStatusListener((status) {
      calculateAndAnimate(status);
    });
    isGoingRight = end.dx > begin.dx;
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void calculateAndAnimate(AnimationStatus status) {
    if (status != AnimationStatus.completed &&
        status != AnimationStatus.dismissed) {
      return;
    }
    final Random random = Random();
    final Function calculateDx = (curr) {
      double dx = pow(-1, random.nextInt(1)) * 1 / 8;
      if (curr.dx + dx >= 1 / 2 || curr.dx + dx <= -1 / 2) {
        dx *= -1;
      }
      dx += curr.dx;
      return dx;
    };
    Function animate;
    if (status == AnimationStatus.completed) {
      begin = Offset(calculateDx(begin), 0);
      isGoingRight = end.dx < begin.dx;
      animate = _controller.reverse;
    } else {
      end = Offset(calculateDx(end), 0);
      isGoingRight = end.dx > begin.dx;
      animate = _controller.forward;
    }
    Future.delayed(Duration(seconds: random.nextInt(2) + 3), () {
      setState(() {
        _position = Tween(
          begin: begin,
          end: end,
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
        animate();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      constraints: const BoxConstraints(minWidth: double.infinity),
      color: C.dayBackground,
      child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: <Widget>[
            SlideTransition(
              position: _position,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    height: 80.0,
                    child: isGoingRight ? _lookingRight : _lookingLeft,
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
