import 'package:flutter/material.dart';
import 'main.dart'; // Imports LoginPage from main.dart

// ------------------- WELCOME SCREEN WITH OPACITY FADE -------------------
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Fade in after screen loads
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: 1200),
            curve: Curves.easeIn,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_pin,
                  size: 100.0,
                  color: Colors.blue,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Welcome to My App',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Your personal profile portal',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 40.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------- CROSS FADE ANIMATION DEMO -------------------
class AnimatedCrossFadeWidget extends StatefulWidget {
  @override
  _AnimatedCrossFadeWidgetState createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _crossFadeStateShowFirst = true;

  void _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = !_crossFadeStateShowFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              sizeCurve: Curves.bounceOut,
              crossFadeState: _crossFadeStateShowFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Container(
                color: Colors.amber,
                height: 100.0,
                width: 100.0,
                child: Center(
                  child: Text(
                    'First Child',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              secondChild: Container(
                color: Colors.lime,
                height: 220.0,
                width: 220.0,
                child: Center(
                  child: Text(
                    'Second Child',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: _crossFade,
              child: Text('Tap to Fade Color & Size'),
            ),
          ],
        ),
      ),
    );
  }
}