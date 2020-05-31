import 'package:flutter/material.dart';

class BasicsScreen extends StatefulWidget {
  @override
  _BasicsScreenState createState() => _BasicsScreenState();
}

class _BasicsScreenState extends State<BasicsScreen> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn)
     ..addListener(() {
       setState(() {
          debugPrint("the numbers: ${animation.value}");
       });
     });
    animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Animations"),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
}
