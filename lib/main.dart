import 'package:flutter/material.dart';
import 'package:route_animation/pageB.dart';
import 'package:route_animation/animation_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _dx = 0.0;
  double _dy = 0.0;
  double _fade = 1.0;
  double _scale = 1.0;
  double _rotation = 0.0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: new Padding(
        padding: new EdgeInsets.only(left: 30.0, right: 30.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Slider(
              min: 0.0,
              max: 1.0,
              value: _dx,
              onChanged: (double v) {
                setState(() {
                  _dx = v;
                });
              },
            ),
            new Text("Slide X from $_dx to 0"),
            new SizedBox(height: 20.0,),
            new Slider(
              min: 0.0,
              max: 1.0,
              value: _dy,
              onChanged: (double v) {
                setState(() {
                  _dy = v;
                });
              },
            ),
            new Text("Slide Y from $_dy to 0"),
            new SizedBox(height: 20.0,),
            new Slider(
              min: 0.0,
              max: 1.0,
              value: _fade,
              onChanged: (double v) {
                setState(() {
                  _fade = v;
                });
              },
            ),
            new Text("Fade from $_fade to 1"),
            new SizedBox(height: 20.0,),
            new Slider(
              min: 0.0,
              max: 1.0,
              value: _scale,
              onChanged: (double v) {
                setState(() {
                  _scale = v;
                });
              },
            ),
            new Text("Scale from $_scale to 1"),
            new SizedBox(height: 20.0,),
            new Slider(
              min: 0.0,
              max: 1.0,
              value: _rotation,
              onChanged: (double v) {
                setState(() {
                  _rotation = v;
                });
              },
            ),
            new Text("Rotation from $_rotation to 1"),
            new SizedBox(height: 20.0,),
            new FlatButton(
              child: new Text("start",style: new TextStyle(color: Colors.white),),
              color: Colors.blue.shade500,
              onPressed: () {
                Navigator.of(context).push(new AnimationPage(
                    builder: (BuildContext builder) {
                      return new PageB();
                    },
                    slideTween: new Tween<Offset>(
                        begin: new Offset(_dx, _dy), end: Offset.zero),
                    fadeTween: new Tween<double>(begin: _fade, end: 1.0),
                    scaleTween: new Tween<double>(begin: _scale, end: 1.0),
                    rotationTween:
                        new Tween<double>(begin: _rotation / 2, end: 0.0)));
              },
            ),
          ],
        ),
      )),
    );
  }
}
