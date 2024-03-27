import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:just_audio/just_audio.dart';

class RollDie extends StatefulWidget{
  const RollDie({super.key});
  @override
  State<RollDie> createState() => _RollDie();
}

class _RollDie extends State<RollDie>{
  // Variables used for roll die
  Random random = Random();
  int currentImageIndex = 0;
  int counter = 1;
  List<String> images = [
    'assets/dice_1.png',
    'assets/dice_2.png',
    'assets/dice_3.png',
    'assets/dice_4.png',
    'assets/dice_5.png',
    'assets/dice_6.png',
  ];
  //AudioPlayer player = AudioPlayer();

  // Roll die home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Roll a Die',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              images[currentImageIndex],
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 200,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
                onPressed: () async{
                  Timer.periodic(const Duration(milliseconds: 80), (timer) {
                    counter++;
                    setState(() {
                      currentImageIndex=random.nextInt(6);
                    });
                    if(counter>=13){
                      timer.cancel();
                      setState(() {
                        counter=1;
                      });
                    }
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'R O L L',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade400,
                border: Border.all(
                  color: Colors.green,
                  width: 20.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text("     ${currentImageIndex+1}     ",
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

}