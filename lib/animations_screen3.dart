import 'package:flutter/material.dart';

class BlogDetail extends StatefulWidget {

  @override
  _BlogDetailState createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation imageAnimation;
  Animation titleAnimation;
  Animation postAnimation;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));

    imageAnimation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));

    titleAnimation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController, curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    postAnimation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController, curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Blog Detail'),
            backgroundColor: Colors.grey,
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(
                        imageAnimation.value * width, 0.0, 0.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/blog-image.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        titleAnimation.value * width, 0.0, 0.0),
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.4,
                      padding: EdgeInsets.all(40.0),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.5)
                      ),
                      child: Center(
                        child: Text('Lorem Ipsum Dolor', style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),),
                      ),
                    ),
                  ),
                ],
              ),
              Transform(
                transform: Matrix4.translationValues(
                    postAnimation.value * width, 0.0, 0.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: EdgeInsets.all(40.0),

                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Duis gravida efficitur nisl, vel ultrices augue pretium id. '
                        'Duis sit amet magna et justo condimentum tincidunt. '
                        'Aliquam maximus dolor a massa interdum tempus ac sit amet eros. ',
                    style: TextStyle(fontSize: 22.0),

                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
