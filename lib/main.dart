import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingTextAnimation(),
    );
  }
}

class FadingTextAnimation extends StatefulWidget {
  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  double _currentSliderValue = 1;
  bool _isVisible = true;
  Image myImage = Image.network(
    'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/d3789c8c-0874-407c-a457-03b147f59b18/deq4bhq-e1c4ce2a-d32b-42e7-9cbe-d764c2201538.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2QzNzg5YzhjLTA4NzQtNDA3Yy1hNDU3LTAzYjE0N2Y1OWIxOFwvZGVxNGJocS1lMWM0Y2UyYS1kMzJiLTQyZTctOWNiZS1kNzY0YzIyMDE1MzgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.XOoSJDCA9vikjYTpSuQLA4bCQ6467YrbPSVd7t28xQs',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fading Text Animation'),
      ),
      body: Column(
        children: [
          Center(
            child: AnimatedOpacity(
              opacity: _currentSliderValue,
              duration: Duration(seconds: 0),
              child: myImage,
            ),
          ),
          Slider(
            value: _currentSliderValue,
            max: 1,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          AnimatedContainer(
            height: 200,
            curve: Curves.bounceIn,
            duration: const Duration(milliseconds: 200),
            child: AnimatedOpacity(
              opacity: _currentSliderValue,
              duration: Duration(seconds: 0),
              child: myImage,
            ),
          )
        ],
      ),
    );
  }
}
