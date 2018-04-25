import 'package:flutter/material.dart';

void main()=>  runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      )
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500)
    );

    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );

    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
         new Image(
           image: new AssetImage("assets/landing.jpg"),
           fit: BoxFit.cover,
           color: Colors.black87,
           colorBlendMode: BlendMode.darken,
         ),
         new Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             new FlutterLogo(
               size: _iconAnimation.value * 140.0,
                    ),
             
           ],
         )
        ],
      )
    );
  }
}