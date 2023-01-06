import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

// flutter run --no-noteSound-null-safety

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  final player = AudioPlayer();

  void noteSound(int numberOfNote) {
    print('assets/note$numberOfNote.wav');
    player.setAsset('assets/note$numberOfNote.wav');
    player.play();
  }

  Widget buildKey(int numberOfNote, Color color) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          noteSound(numberOfNote);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Text(""),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(1, Colors.red),
            buildKey(2, Colors.orange),
            buildKey(3, Colors.yellow),
            buildKey(4, Colors.green),
            buildKey(5, Colors.greenAccent),
            buildKey(6, Colors.blue),
            buildKey(7, Colors.purple),
          ],
        )),
      ),
    );
  }
}
