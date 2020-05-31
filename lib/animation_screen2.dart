import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation avatarAnimation;
  Animation dividerAnimation;
  Animation nameAnimation;
  Animation emailAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 10000));
    avatarAnimation = Tween(begin: 0.0, end: 500.0).animate(animationController)
     ..addListener(() {
       setState(() {});
     });

    nameAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: animationController, curve: Interval(0.350, 0.450, curve: Curves.easeIn)));

    emailAnimation = Tween(begin: 0.0, end: 0.84)
        .animate(CurvedAnimation(parent: animationController, curve: Interval(0.500, 0.600, curve: Curves.easeIn)));

    dividerAnimation = Tween(begin: 0.0, end: 225.0)
        .animate(CurvedAnimation(parent: animationController, curve: Interval(0.650, 0.75, curve: Curves.fastOutSlowIn)));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Edit Profile'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 100,
                    child: ClipOval(
                      child: SizedBox(
                        width: avatarAnimation.value,
                        height: avatarAnimation.value,
                        child: Image.network(
                          "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 60.0),
                child: IconButton(icon: Icon(Icons.camera_alt, size: 30.0,),
                    onPressed: (){

                }),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.black.withOpacity(0.79),
              margin: EdgeInsets.symmetric(vertical: 14.0),
              width: dividerAnimation.value,
              height: 1.0,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Align(alignment: Alignment.centerLeft,
                        child: Text('Username', style: TextStyle(color: Colors.grey, fontSize: 15.0),),
                        ),
                        Align(alignment: Alignment.centerLeft,
                          child: Text('John Doe',
                            style: TextStyle(
                                color: Colors.black.withOpacity(nameAnimation.value),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                            ),),
                        ),
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: IconButton(icon: Icon(Icons.edit, color: Colors.blue,), onPressed: null),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Align(alignment: Alignment.centerLeft,
                          child: Text('Email', style: TextStyle(color: Colors.grey, fontSize: 15.0),),
                        ),
                        Align(alignment: Alignment.centerLeft,
                          child: Text('johndoe@email.com', 
                            style: TextStyle(
                                color: Colors.black.withOpacity(emailAnimation.value),
                                fontSize: 20.0, 
                                fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: IconButton(icon: Icon(Icons.edit, color: Colors.blue,), onPressed: null),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(onPressed: (){},
            color: Colors.blue,
              child: Text('Update', style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
}
