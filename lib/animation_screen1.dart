import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));

    animation = Tween(begin: 150.0, end: 400.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
                top: animation.value,
                left: MediaQuery.of(context).size.width / 3.0,
                child: ScaleTransition(
                  scale: animationController,
                  child: Icon(
                    Icons.check_circle,
                    size: 150,
                    color: Colors.amber,
                  ),
                ))
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
