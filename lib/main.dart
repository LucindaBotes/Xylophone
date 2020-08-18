import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  List<Widget> generateKeys() {
    List<Color> colours = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple
    ];
    List keys = new List<Widget>();
    for (int i = 1; i < 8; i++) {
      keys.add(
        Expanded(
          child: FlatButton(
            color: colours[i - 1],
            onPressed: () {
              playSound(i);
            },
          ),
        ),
      );
    }
    return keys;
  }

  void playSound(int note) {
    final AudioCache player = AudioCache();
    player.play('note$note.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: generateKeys(),
          ),
        ),
      ),
    );
  }
}
